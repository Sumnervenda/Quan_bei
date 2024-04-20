import { DEFAULT } from '@ohos/hypium'
import router from '@ohos.router';
import radio from '@ohos.telephony.radio';
import font from '@ohos.font';
import { Piece_of_data } from '../Component/Piece_of_data';
import  Home from '../view/Home'
import  Manage_money from '../view/Manage_money'
import  Schedual from '../view/Schedual'
import  Mine from '../view/Mine'

@Entry
@Component
//构建首页布局
struct Index {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  //写tabbar的内容参数
  @Builder TabBuilder(index: number,url_active:Resource,url_normal:Resource,text:string) {
    Column() {
      //判断图片和端口是否一致，然后给出active和normal两种图片，即是否被选中
      Image(this.currentIndex === index ? url_active: url_normal)
        .width(64)
        .height(64)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)

    }.width('100%')
  }



  build() {
      Column() {
        Image('assets/Status_Bar.png')
          .width('100%')

        //导航栏
        Tabs({ barPosition: BarPosition.End, controller: this.controller }){
          TabContent() {
            //点规划按钮要跳出的view，Home页
            Column() {
              Home()
            }.width('100%')
            .height('100%')
          }
          .tabBar(this.TabBuilder(0,$r('app.media.bill_active'),$r('app.media.bill_normal'),'账单'))//规划按钮

          TabContent() {
            //点理财按钮要跳出的view，Manage_money页
            Column() {
              Manage_money()

              Divider()
                .strokeWidth(1)
                .color('#ff004699')

            }.width('80%')
          }.tabBar(this.TabBuilder(1,$r('app.media.money_active'),$r('app.media.money_normal'),'理财'))//理财按钮

          TabContent() {
            //点规划按钮要跳出的view，Schedual页
            Column() {
              Schedual()

              Divider()
                .strokeWidth(0.5)
                .color('#182431')
                .opacity(0.05)
            }.width('100%')
          }.tabBar(this.TabBuilder(2,$r('app.media.schedual_active'),$r('app.media.schedual_normal'),'规划'))//规划按钮

          TabContent() {
            //点我的按钮要跳出的view，mine页
            Column() {
              Mine()

              Divider()
                .strokeWidth(0.5)
                .color('#182431')
                .opacity(0.05)
            }.width('80%')
          }.tabBar(this.TabBuilder(3,$r('app.media.mine_active'),$r('app.media.mine_normal'),'我的'))//我的按钮
        }
        .vertical(false)
        .barHeight(72)
        .onChange((index: number) => {
          this.currentIndex = index
        })
        .width('100%')
        .height('94.5%')
        .backgroundColor('#ffffffff')
        .margin({ top:0 })
      }
      .height("100%")
      .width('100%')

  }

}

