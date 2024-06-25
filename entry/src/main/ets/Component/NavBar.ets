import router from '@ohos.router';

@Component
struct NavBar {
  title: string = '个人信息'
  showBackIcon: boolean = true
  backSrc: ResourceStr = $r('app.media.back_btn')
  fontColor: string = '#000'
  onBackClick: () => void = () => {}

  build() {

    Stack({alignContent: Alignment.Start}) {
      // 在界面顶部放置一个与状态栏同高度的组件，用于占位，可避免界面内容与状态栏内容重叠
      Row() {
        Image(this.backSrc)
          .width(68)
          .height(38)
          .onClick(() => {
            this.onBackClick()
          })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .padding({left:16})
      .height(60)
      .zIndex(999)
      Row() {
        Text(this.title)
          .fontColor(this.fontColor)
          .fontSize(20)
          .fontWeight(500)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(VerticalAlign.Center)
    }
    .height(60)
    .width("100%")
    .backgroundColor(Color.Transparent)
  }
}

export { NavBar }