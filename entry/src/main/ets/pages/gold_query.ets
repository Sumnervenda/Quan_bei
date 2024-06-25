import http from '@ohos.net.http';
import router from '@ohos.router';
const  api_key = "goldapi-bc9slvw018h6-io"
const symbol = "XAU"
const  curr = "CNY"
const date = ""
const url = "https://www.goldapi.io/api/XAU/CNY"
let message = ''
let httpRequest = http.createHttp();
// 用于订阅HTTP响应头，此接口会比request请求先返回。可以根据业务需要订阅此消息
// 从API 8开始，使用on('headersReceive', Callback)替代on('headerReceive', AsyncCallback)。 8+
httpRequest.on('headersReceive', (header) => {
  console.info('header: ' + JSON.stringify(header));
});
@Entry
@Component
struct Gold_query {
  @State message1: string = '432.51'+"￥"
  @State message2: string = '433.52'+"￥"
  @State message3: string = '431.43'+"￥"
  @State message4: string = '430.50'+"￥"
  @State time1:string = ''
  @State time2:string = ''
  @State time3:string = ''
  @State count:number =0

  build() {
    Row() {
      Column() {


        Stack() {



          Image($r('app.media.gold_chaxun'))
          Image($r('app.media.Arrow_left_light'))
            .width(44)
            .position({
              x:"4%",
              y:"3%"
            })
            .onClick(()=>{
              router.back()
            })

          Button("点我刷新")
            .onClick(()=>{

              if(this.count==3){
                this.message4=this.message3
                this.message3=this.message2
                this.message2=this.message1
                this.count=0
              }if(this.count==2){
                this.message3=this.message2
                this.message2=this.message1
                this.count=this.count+1
              }if (this.count==1) {
                this.message2=this.message1
                this.count=this.count+1
              }if(this.count==0){
                this.count=this.count+1
              }



              httpRequest.request(
                // 填写HTTP请求的URL地址，可以带参数也可以不带参数。URL地址需要开发者自定义。请求的参数可以在extraData中指定
                "https://www.goldapi.io/api/XAU/CNY",
                {
                  method: http.RequestMethod.GET, // 可选，默认为http.RequestMethod.GET
                  // 开发者根据自身业务需要添加header字段
                  header: {
                    "x-access-token": api_key,
                    "Content-Type": "application/json"
                  },

                }, (err, data) => {
                if (!err) {
                  // data.result为HTTP响应内容，可根据业务需要进行解析
                  console.log('Result:' + JSON.stringify(data.result));
                  console.log('code:' + JSON.stringify(data.responseCode));
                  // data.header为HTTP响应头，可根据业务需要进行解析
                  console.log('header:' + JSON.stringify(data.header));
                  console.log('cookies:' + JSON.stringify(data.cookies));
                  let result=JSON.parse(data.result.toString()).price_gram_24k;
                  console.log("result"+result);
                  this.message1=result.toString().substring(0,6)+"￥";




                  // 8+
                } else {
                  console.log('error:' + JSON.stringify(err));
                  this.message1='失败'
                  // 取消订阅HTTP响应头事件
                  httpRequest.off('headersReceive');
                  // 当该请求使用完毕时，调用destroy方法主动销毁
                  httpRequest.destroy();
                }
              }
              );
            })
            .position({
              x:"69%",
              y:"18.7%"
            })
            .backgroundColor("#009b14cd")
            .fontColor("#006aff")
          Text(this.message1)
            .position({
              x:"9.5%",
              y:"22%"
            })
            .fontColor("#fad202")
            .fontWeight(FontWeight.Bold)
            .fontSize(20)


        }
        .width("100%")
        .height("100%")
      }
      .width('100%')
    }
    .height('100%')
  }
}