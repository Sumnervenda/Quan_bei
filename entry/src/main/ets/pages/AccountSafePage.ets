import router from '@ohos.router'
import { NavBar } from '../component/NavBar'

@Entry
@Component
struct UserInfoPage {
  build() {
    Column() {
      NavBar({ title: '账号与安全', onBackClick: () => {
        router.back()
      } })
      Stack({alignContent:Alignment.Top}) {

        Image($r('app.media.account_safe'))
          .objectFit(ImageFit.Cover)
          .height(700)
          .width('100%')
        Image($r('app.media.save'))
          .height(50)
          .margin({top: 600})
          .onClick(() => {
            router.pushUrl({
              url: 'pages/SuccessPage'
            })
          })

      }
    }
  }
}