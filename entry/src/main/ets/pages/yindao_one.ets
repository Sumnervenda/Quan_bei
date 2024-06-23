import router from '@ohos.router'
@Entry
@Component
struct Yindao_one {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
         Image($r('app.media.yindao_one'))
           .width('60%')
           .position({x:"20%",y:"25%"})
      }
      Column(){
        Button('开始')
          .width('30%')
          .height('6%')
          .fontSize(20)
          .position({x:"35%",y:"68%"})
          .shadow({radius:20,color:0xE0E0E0,offsetX: 10, offsetY: 10})
          .onClick(()=>{
            router.pushUrl({url :'pages/yindao_two'})
          })
      }
    }
    .height('100%')
  }
}