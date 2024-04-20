import router from '@ohos.router'
@Entry
@Component
struct Home {
  @State message: string = '这是Home'
  @State place_holder: string ='这是搜索'
  @State widthSize: string = '100%'
  @State heightSize: number = 35
  @State flag:Boolean = true
  @State change:string=''

  build() {
    Row() {
      Column() {
        Image('assets/Status_Bar.png')
          .width("100%")
        Row() {

          Search({ value: this.change, placeholder: this.place_holder })
            .height(this.heightSize)
            .width(this.widthSize)
            .searchButton('SEARCH')
            .align(Alignment.End)
        }
        .align(Alignment.TopStart)
        .alignItems(VerticalAlign.Center)
        .width('85%')
      }
      .width('100%')
      .height('100%')


    }
    .width('100%')
    .height('100%')
  }
}