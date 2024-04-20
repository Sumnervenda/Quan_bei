import router from '@ohos.router';

@Entry
@Component
struct Mine {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Image('assets/mine.png')
        Row({space:60}){
          Button(){
            Text("账单")
              .fontColor("#00ffffff")
          }
          .backgroundColor("#00ffffff")
          .onClick(()=>{router.pushUrl({
            url:'pages/Index'
          })})
          Button(){
            Text("理财")
              .fontColor("#00ffffff")
          }
          .backgroundColor("#00ffffff")
          .onClick(()=>{router.pushUrl({
            url:'pages/licai'
          })})
          Button(){
            Text("规划")
              .fontColor("#ff8f0000")
          }
          .backgroundColor("#ff4a0000")
          .onClick(()=>{router.pushUrl({
            url:'pages/tongji'
          })})
          Button(){
            Text("我的")
              .fontColor("#ffffff")
          }
          .backgroundColor("#ffffff")
          .onClick(()=>{router.pushUrl({
            url:'pages/mine'
          })})


        }//跳转功能
        .margin({
          top:-110
        })
        .width("86%")
      }
      .width('100%')
    }
    .height('100%')
  }
}