

@Component//定义一个组件，传入下列5个参数，组件内容会自动改变。
export struct Card_new{
  @State Title : string ='股票'
  img_url :Resource = $r('app.media.icon')
  @State Rate_color_red : string = "#c10f0f"
  @State Rate_color_green : string = '#20a000'
  @Styles img_style(){
    .width(50)
    .height(50)
  }

  build() {

      Column() {
        Image(this.img_url).img_style()
        Text(this.Title)
          .fontSize(16)
          .margin({
            top: 8
          })

      }
      .shadow({
        radius:20,
        color: "#1a000000",
        offsetX:0,
        offsetY:8,
      })
      .height(96)
      .width(96)
      .borderRadius(16)

      .justifyContent(FlexAlign.Center)

    }


}