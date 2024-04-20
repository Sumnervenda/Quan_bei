import router from '@ohos.router'

@Component
export default struct Schedual {
  @State message: string = '这是Home'
  @State place_holder: string = '这是搜索'
  @State widthSize: string = '100%'
  @State heightSize: number = 35
  @State flag: Boolean = true
  @State change: string = ''

  build() {
    Row() {
      Column() {


        Image('assets/tongji.png')

      }
      .width('100%')
      .height('100%')
    }
  }
}