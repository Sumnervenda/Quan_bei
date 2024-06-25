import router from '@ohos.router'
@Entry
@Component
struct Yindao_two {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Image($r('app.media.yindao_two'))
          .width('90%')
          .position({x:"5%",y:"20%"})
      }
      Column(){
        Button('继续')
          .width('30%')
          .height('6%')
          .fontSize(20)
          .margin({
            top:520
          })
          .shadow({radius:20,color:0xE0E0E0,offsetX: 10, offsetY: 10})
          .onClick(()=>{
          router.pushUrl({url :'pages/yindao_three'})
        })
      }.width("100%")
    }
    .height('100%')
  }
}