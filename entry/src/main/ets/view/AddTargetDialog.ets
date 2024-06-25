import http from '@ohos.net.http';
import {UserModel} from 'ets/viewmodel/userModel'


@Component
@CustomDialog
export default struct AddTargetDialog {
  @State spend_type : string = ''
  @State deal_name: string = '';
  now_time:Date = new Date();
  @State spend_money:string = '';
  @State week_name: string = '';
  @State flag : boolean = true//支出为true 收入为false
  @State spend_or_income : number = 1  //支出为1，收入为0
  @State normal_backgroundColor : string = '#d8d8d8'
  @State normal_fontColor : string = '#717171'
  @State active_backgroundColor :string ='#006aff'
  @State active_fontColor : string = '#ffffff'
  @State date_picker : string = '4月15日'
  img_url : Resource = $r('app.media.app_icon');
  private controller?: CustomDialogController;
  onClickOk?: (value1: string,value2:string,value3:string,value4:string,value5:boolean) => void;
  value_spend: [{value:'饮食消费'}, {value:'娱乐消费'}, {value:'学习消费'}, {value:'生活消费'}, {value:'租金消费'}, {value:'交通运输'}, {value:'服装消费'}]
  value_income: [{value:'工资收入'}, {value:'奖学金'}, {value:'助学金'}, {value:'勤工俭学'}, {value:'兼职'}, {value:'他人汇入'}, {value:'其他'}]

  build() {
    Column() {

      Blank().height("5%")
      Row() {
        Button("支出")
          .backgroundColor(this.flag === true ? this.active_backgroundColor : this.normal_backgroundColor)
          .fontColor(this.flag === true ? this.active_fontColor : this.normal_fontColor)
          .onClick(() => {
            this.flag = true
          })
          .height(32)
        Blank()
          .width('10%')
        Button("收入")
          .backgroundColor(this.flag === true ? this.normal_backgroundColor : this.active_backgroundColor)
          .fontColor(this.flag === true ? this.normal_fontColor : this.active_fontColor)
          .onClick(() => {
            this.flag = false
          })
          .height(32)

      }


      Row() {
        Column() {
          Text("类型")
          Blank()
            .height(10)
          if (this.flag === true) {
            Select(
              [{ value: '饮食消费' },
                { value: '娱乐消费' },
                { value: '学习消费' },
                { value: '生活消费' },
                { value: '租金消费' },
                { value: '交通运输' },
                { value: '服装消费' }]
            )
              .onSelect((index:number,value:string)=>{
                this.spend_type=value
              })
              .width(140)
              .height(40)
              .value('支出类型')
              .selected(0)
              .border({
                width: 1.5
              })
              .borderRadius(8)
              .borderColor('#d8d8d8')
          }
          else {
            Select(
              [{ value: '工资收入' },
                { value: '奖学金' },
                { value: '助学金' },
                { value: '勤工俭学' },
                { value: '兼职' },
                { value: '他人汇入' },
                { value: '其他' }]
            )
              .onSelect((index:number,value:string)=>{
                this.spend_type=value
              })
              .value('收入类型')
              .selected(0)
              .width(140)
              .height(40)
              .border({
                width: 1.5
              })
              .borderRadius(8)
              .borderColor('#d8d8d8')
          }
        }
        .alignItems(HorizontalAlign.Start)
        .width('45%')


        Blank()
          .width('10%')

        Column() {
          Text("金额")
          Blank()
            .height(10)
          Row() {
            Image($r("app.media.app_icon"))
              .width(16)
              .margin({
                left: 5
              })

            TextInput({ placeholder: "" })
              .placeholderColor(Color.Grey)
              .backgroundColor('#00ffffff')
              .borderRadius(4)
              .onChange((value:string) => {
                this.spend_money = value;

              })
              .width('100%')
              .height(40)

          }
          .border({
            width: 1.5
          })
          .borderRadius(8)
          .borderColor('#d8d8d8')

        }
        .width('45%')
        .alignItems(HorizontalAlign.Start)
      }
      .width('86%')
      .margin({
        top:20
      })

      Row(){
        Text(this.date_picker)
          .textAlign(TextAlign.Center)
          .border({
            width:1.5
          })
          .borderRadius(8)
          .borderColor('#d8d8d8')
          .height(40)
          .width('45%')
          .margin({
            top:20
          })
          .align(Alignment.Start)

        Button("选择日期")
          .backgroundColor("#00ffffff")
          .fontColor("#d8d8d8")
          .borderWidth(1.5)
          .borderColor("#d8d8d8")
          .borderRadius(8)
          .type(ButtonType.Normal)
          .margin({
            top:20,
            left:30
          })
          .onClick(() => {
            DatePickerDialog.show({
              start: new Date("2000-1-1"),
              end: new Date("2100-12-31"),
              selected: this.now_time,
              onAccept: (value: DatePickerResult) => {
                // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
                this.now_time.setFullYear(value.year, value.month, value.day)
                console.info("DatePickerDialog:onAccept()" + JSON.stringify(value))
                this.date_picker=value.month+'月'+value.day+'日'
              },
              onCancel: () => {
                console.info("DatePickerDialog:onCancel()")
              },
              onChange: (value: DatePickerResult) => {
                console.info("DatePickerDialog:onChange()" + JSON.stringify(value))
                this.date_picker=value.month+'月'+value.day+'日'
              }
            })
          })
      }
      .width('86%')


      Column() {

        Text('备注')

        Blank()
          .height(10)

        TextInput({ placeholder: "填写收支说明" })
          .placeholderColor(Color.Grey)
          .border({
            width: 1.5
          })
          .borderColor('#d8d8d8')
          .borderRadius(8)
          .backgroundColor('#00ffffff')
          .height(40)
          .onChange((value: string) => {
            this.deal_name = value;
          })
      }
      .margin({
        top:10
      })
      .width('86%')
      .alignItems(HorizontalAlign.Start)

      Row() {
        Button("取消")
          .onClick(() => {
            this.controller?.close();
          })
          .backgroundColor(this.normal_backgroundColor)
          .fontColor(this.normal_fontColor)
          .width(96)

        Blank().width('30%')

        Button("确认")
          .onClick(() => {
            if (this.onClickOk !== undefined) {
              // this.onClickOk(this.deal_name,this.now_time,this.spend_money,this.week_name);
              this.onClickOk(this.spend_type,this.spend_money,this.date_picker,this.deal_name,this.flag)


              //服务器请求代码，插入数据
              // if(this.flag){
              // this.spend_or_income=1
              // }else{
              // this.spend_or_income=0
              // }
              // let user=new UserModel("create",this.spend_or_income,this.date_picker,this.spend_type,this.deal_name,Number(this.spend_money))
              // let paramdata=Object.keys(user).map(key =>
              // encodeURIComponent(key) + '=' + encodeURIComponent(user[key])
              // ).join('&');
              //
              // let httpRequest = http.createHttp();
              // httpRequest.request(
              //   "https://hkf.cccxwm.chat/insert.php",
              //   {
              //     method:http.RequestMethod.POST,
              //     header: {
              //       "Content-Type": "application/x-www-form-urlencoded"
              //       // "Content-Type": "application/JSON"
              //     },
              //     // extraData: { 'action':'read', 'id':'1', 'accountType':'1', 'date_now':'2024-6-25', 'typeText':'交通运输', 'accountPrompt':'123', 'amount':'123' }
              //
              //     // extraData:user
              //
              //     extraData:paramdata
              //
              //   },(err, data: http.HttpResponse) => {
              //   if (!err) {
              //     // data.result为HTTP响应内容，可根据业务需要进行解析
              //     console.log('Result:' + JSON.stringify(data.result));
              //     console.log('code:' + JSON.stringify(data.responseCode));
              //     console.log('type:' + JSON.stringify(data.resultType));
              //     // data.header为HTTP响应头，可根据业务需要进行解析
              //     console.log('header:' + JSON.stringify(data.header));
              //     console.log('cookies:' + JSON.stringify(data.cookies)); // 自API version 8开始支持cookie
              //     // 取消订阅HTTP响应头事件
              //
              //     httpRequest.off('headersReceive');
              //     // 当该请求使用完毕时，开发者务必调用destroy方法主动销毁该JavaScript Object。
              //     httpRequest.destroy();
              //   } else {
              //     console.log('error:' + JSON.stringify(err));
              //     // 取消订阅HTTP响应头事件
              //     httpRequest.off('headersReceive');
              //     // 当该请求使用完毕时，开发者务必调用destroy方法主动销毁该JavaScript Object。
              //     httpRequest.destroy();
              //   }
              // }
              // );


            }
          })
          .backgroundColor(this.active_backgroundColor)
          .fontColor(this.active_fontColor)
          .width(96)
      }
      .margin({
        top:40
      })
      .justifyContent(FlexAlign.SpaceBetween)

      Blank().height("8%")
    }
    .width("100%")
    .backgroundColor('#fffefefe')
    .borderRadius(12)
  }
}

/**
 * Custom button style.
 */
@Extend(Button) function dialogButtonStyle() {

  .backgroundColor(Color.White)

}