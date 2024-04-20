import router from '@ohos.router';
@Entry
@Component
struct Tongji {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Image('assets/tongji.png')
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
              .fontColor("#00ffffff")
          }
          .backgroundColor("#00ffffff")
          .onClick(()=>{router.pushUrl({
            url:'pages/tongji'
          })})
          Button(){
            Text("我的")
              .fontColor("#00ffffff")
          }
          .backgroundColor("#00ffffff")
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