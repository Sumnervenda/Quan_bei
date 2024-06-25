//
// @Component//定义一个组件，传入下列5个参数，组件内容会自动改变。
// export struct Piece_of_data{
//   @State Date_mm_dd_week : string ='4月12日 周五'
//   img_deal : Resource =$r('app.media.icon')//在此处定义img_deal ，传入图片的路径参数
//   @State deal_labels : string = '午餐'
//   @State buy_labels : string = '外卖'
//   @State money : string = '-27'
//   @Styles img_style(){
//     .width(50)
//     .height(50)
//   }
//
//   build(){
//     Column() {
//       Text(this.Date_mm_dd_week)
//         .fontSize(12)
//         .fontColor("#999999")
//         .textAlign(TextAlign.Start)
//         .width('100%')
//       Row() {
//         Image(this.img_deal).img_style()
//           .align(Alignment.Center)
//             //Image($r(this.img_deal))  在此处传入参数，但是无法正常加载图片
//           .margin({
//             left:15,
//             top:15,
//             bottom:15
//           })
//         Column() {
//           Text(this.deal_labels)
//             .fontSize(17)
//             .textAlign(TextAlign.Start)
//             .width("100%")
//           Text(this.buy_labels)
//             .fontSize(10)
//             .fontColor("#999999")
//             .textAlign(TextAlign.Start)
//             .width("100%")
//         }
//         .margin({
//           left:16
//         })
//         .width("48%")
//
//         Text(this.money)
//           .fontSize(22)
//           .fontWeight(FontWeight.Medium)
//       }
//       .shadow({
//         radius:20,
//         color: "#1a000000",
//         offsetX:0,
//         offsetY:8,
//       })
//       .margin({
//         top:6
//       })
//       .width('100%')
//       .borderRadius(10)
//     }
//     .width('86%')
//
//   }
//
// }



import DataModel, { TaskItemBean } from '../viewmodel/DataModel';


@Component//定义一个组件，传入下列5个参数，组件内容会自动改变。
export struct Piece_of_data{
  @State Date_mm_dd_week : string ='4月12日 周五'
  img_deal : Resource =$r('app.media.app_icon')//在此处定义img_deal ，传入图片的路径参数
  @State deal_labels : string = '午餐'
  @State buy_labels : string = '外卖'
  @State money : string = '-27'
  @Link selectArr: Array<boolean>;
  public index: number = 0;
  @Link @Watch('onClickIndexChanged') clickIndex: number;
  @Prop isEditMode: boolean = false;
  @State isExpanded: boolean = false;
  @Styles img_style(){
    .width(50)
    .height(50)
  }

  onClickIndexChanged() {
    if (this.clickIndex !== this.index) {
      this.isExpanded = false;
    }
  }

  build(){
    Column() {
      Text(this.Date_mm_dd_week)
        .fontSize(12)
        .fontColor("#999999")
        .textAlign(TextAlign.Start)
        .width('100%')
      Row() {
        Image(this.img_deal).img_style()
          .align(Alignment.Center)
            //Image($r(this.img_deal))  在此处传入参数，但是无法正常加载图片
          .margin({
            left:15,
            top:15,
            bottom:15
          })
        Column() {
          Text(this.deal_labels)
            .fontSize(17)
            .textAlign(TextAlign.Start)
            .width("100%")
          Text(this.buy_labels)
            .fontSize(10)
            .fontColor("#999999")
            .textAlign(TextAlign.Start)
            .width("100%")
        }
        .margin({
          left:16
        })
        .width("48%")

        Text(this.money)
          .fontSize(22)
          .fontWeight(FontWeight.Medium)
        Blank()

        if (this.isEditMode) {
          Row() {
            Checkbox()
              .select(this.selectArr[this.index])
              .selectedColor($r('app.color.main_blue'))
              .width(16)
              .margin({ right: 16 })
              .onChange((isCheck: boolean) => {
                this.selectArr[this.index] = isCheck;
                console.log("该复选框的状态是:"+this.selectArr[this.index]+"该复选框的编号是"+this.index)
              })
          }
          .justifyContent(FlexAlign.End)
        }





      }
      .animation({ duration: 1500 })
      .shadow({
        radius:20,
        color: "#1a000000",
        offsetX:0,
        offsetY:8,
      })
      .margin({
        top:6
      })
      .width('100%')
      .borderRadius(10)
    }
    .width('100%')

  }

}