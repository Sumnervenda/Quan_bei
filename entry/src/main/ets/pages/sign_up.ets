import router from '@ohos.router'
@Entry
@Component
struct Sign_up {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Image($r('app.media.sign_up'))
          .width('54%')
          .position({x:"10%",y:"10%"})
      }
      Column(){
        TextInput({text:'请输入电子邮箱'})
          .width('80%')
          .height('5%')
          .fontColor('#001A4D')
          .fontSize(14)
          .position({x:"10%",y:"41%"})

        TextInput({text:'请输入密码'})
          .width('80%')
          .height('5%')
          .position({x:"10%",y:"50%"})
          .type(InputType.Password)

        TextInput({text:'请确认密码'})
          .width('80%')
          .height('5%')
          .position({x:"10%",y:"59%"})
          .type(InputType.Password)
      }
      Column(){
        Button('注册')
          .width('30%')
          .height('6%')
          .fontSize(20)
          .margin({
            top:400
          })
          .shadow({ radius: 20, color: 0xE0E0E0, offsetX: 10, offsetY: 10 })
          .onClick(() => {
            router.pushUrl({ url: 'pages/sign_in' })
          })
      }.width("100%")
    }
    .height('100%')
  }
}