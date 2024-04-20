
import router from '@ohos.router';
@Entry
@Component
struct Index {
  @State message: string = '圈贝'
  @State message2: string = '一款大学生理财软件'

  build() {
    Stack() {
      Column() {
        Image('assets/add_purchase.png')


      }
      .width('100%')

      Row() {
        Image('assets/Arrow_left_light.png')
          .width(28)
          .height(28)
      }
      .justifyContent(FlexAlign.Center)
      .width(40)
      .height(40)
      .position({ x: '5%', y: '5.5%' })
      .onClick(() => {
        router.back()
      })

    }
    .height('100%')
    .width('100%')
  }

}