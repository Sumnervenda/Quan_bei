import router from '@ohos.router'
import { NavBar } from '../component/NavBar'
@Entry
@Component
struct UserInfoPage {

  build() {
    Stack({alignContent: Alignment.Top}) {
      Column() {
        Image($r('app.media.success'))
          .objectFit(ImageFit.Cover)
          .height(700)
          .width('100%')
      }
      Image($r('app.media.finished'))
        .height(50)
        .margin({top: 600})
        .onClick(() => {
          router.back()
        })
    }
  }
}