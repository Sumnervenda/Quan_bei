import router from '@ohos.router';
@Entry
@Component
struct Share_info {
  @State message: string = 'Hello World'
  @State place_holder: string ='这是搜索'
  @State widthSize: string = '85%'
  @State heightSize: number = 35
  @State flag:Boolean = true
  @State change:string=''

  build() {
    Column() {
      //上面的电量、wifi等tabbar
      Image('assets/Status_Bar.png')
        .width('100%')
      //退出箭头
      Row() {
        Image('assets/Arrow_left_light.png')
          .width(28)
          .height(28)
          .onClick(()=>{router.back()})
        //搜索框
        Search({ value: this.change, placeholder: this.place_holder })
          .height(this.heightSize)
          .width(this.widthSize)
          .searchButton('SEARCH')
          .align(Alignment.End)
          .margin({
            left:14
          })
      }
      .width('85%')
      .height(60)

      //可以滚动的list
      List() {
        ListItem(){
          Row(){
            Divider()
              .vertical(true)
              .strokeWidth(6)
              .color('#00000000')
              .backgroundColor('#007DFB')
              .borderRadius(12)
            Text('我的股票')
              .margin({
                left: 6
              })
              .fontWeight(FontWeight.Bold)
          }
          .width('85%')
          .height('20')
          .margin({
            top:35,
            bottom:10
          })
        }
        ListItem() {
          List() {

          }
          .listDirection(Axis.Horizontal)
          .alignListItem(ListItemAlign.Center)
        }

        ListItem() {
          Image('assets/share_details.png')
            .width('90%')
        }

        ListItem() {
          Image('assets/share_details.png')
            .width('90%')
        }

        ListItem() {
          Image('assets/share_details.png')
            .width('90%')
        }
      }
      .edgeEffect(EdgeEffect.Spring)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .alignListItem(ListItemAlign.Center)
      .width('100%')
    }
  }


}