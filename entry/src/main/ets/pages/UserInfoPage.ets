import router from '@ohos.router'
import { NavBar } from '../component/NavBar'
@Entry
@Component
struct UserInfoPage {

  build() {
    Column() {
      NavBar({onBackClick:() => {
        router.back()
      }})
      Image($r('app.media.user_info'))
        .objectFit(ImageFit.Contain)
        .height(600)
      Image($r('app.media.save'))
        .height(50)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/SuccessPage'
          })
        })
    }
  }
}