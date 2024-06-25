import router from '@ohos.router';

@Entry
@Component
  //构建开屏页
struct Splash {
  @State message1: string = '圈贝'
  @State message2: string = '您的理财小助手'
  @State main_logo_url: string = 'src/main/resources/base/media/splash/main_logo.png'
  @State Font_Color: string ="#006AFF"

  @Styles image_style(){
    .width(128)
    .height(128)
  }


  build() {

      Column() {

        Image($r("app.media.main_logo")).image_style()
          .margin({
            top:255
          })
        Text(this.message1)
          .fontSize(48)
          .fontWeight(FontWeight.Medium)
          .fontColor(this.Font_Color)
          .margin({
            top:54
          })

        Text(this.message2)
          .fontSize(20)
          .fontWeight(FontWeight.Regular)
          .fontColor(this.Font_Color)
          .margin({
            top:16
          })

      }
      .width('100%')


  }

}
//延时三秒跳转到首页
setTimeout(()=>{
  router.pushUrl({
    url:'pages/yindao_one'
  })
},3000)
