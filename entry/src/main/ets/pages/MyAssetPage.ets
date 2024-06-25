import router from '@ohos.router'
import { NavBar } from '../component/NavBar'
@Entry
@Component
struct UserInfoPage {

  build() {
    Column() {
      NavBar({title: '我的资产',onBackClick:() => {
        router.back()
      }})
      Image($r('app.media.my_asset'))
        .objectFit(ImageFit.Cover)
        .height(700)
        .width('100%')
    }
  }
}