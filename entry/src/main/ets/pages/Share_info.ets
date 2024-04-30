import router from '@ohos.router';
@Entry
@Component
struct Share_info {
  @State message: string = 'Hello World'
  @State place_holder: string = '这是搜索'
  @State widthSize: string = '85%'
  @State heightSize: number = 35
  @State flag: Boolean = true
  @State change: string = ''

  build() {
    Column() {
      //上面的电量、wifi等tabbar

      //退出箭头
      Row() {
        Image('assets/Arrow_left_light.png')
          .width(28)
          .height(28)
          .onClick(() => {
            router.back()
          })
        //搜索框
        Search({ value: this.change, placeholder: this.place_holder })
          .height(this.heightSize)
          .width(this.widthSize)
          .searchButton('SEARCH')
          .align(Alignment.End)
          .margin({
            left: 14
          })
      }
      .margin({top:20})
      .width('85%')
      .height(60)

      Row() {
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
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('85%')
      .height('20')
      .margin({
        top: 24,
        bottom: 10
      })


      //横向滑动部分
      Row() {
        //左边卡片
        Row(){
          Column() {
            Row() {
              Image($r('app.media.Nvidia')).height('20%')
              Text('Nvidia')
                .margin({ left: '5%' })
              Text('+5.63').fontColor('#77B900')
                .margin({ left: '20%' })
            }
            Row() {
              Column() {
                Text('现行价格').fontColor('#838383')
                Text('$203.65').fontSize(20)
                  .margin({top:'2%'})
              }
              Image($r('app.media.nvidia_line'))
                .height('35%')
                .margin({left:'8%'})
            }.margin({ top: '8%' ,left:'10%'})
          }

        }.position({x:"-42%",y:"1%"})
        .width('60%').height('16%').backgroundColor('#FFF')
        .borderRadius(12)
        .shadow({ radius: 5, color: 0xE0E0E0, offsetX: 1, offsetY: 1 })

        //中间卡片
        Row(){
          Column() {
            Row() {
              Image($r('app.media.Nvidia')).height('20%')
              Text('Nvidia')
                .margin({ left: '5%' })
              Text('+5.63').fontColor('#77B900')
                .margin({ left: '20%' })
            }
            Row() {
              Column() {
                Text('现行价格').fontColor('#838383')
                Text('$203.65').fontSize(20)
                  .margin({top:'2%'})
              }
              Image($r('app.media.nvidia_line'))
                .height('35%')
                .margin({left:'8%'})
            }.margin({ top: '8%' ,left:'10%'})
          }
        }.width('60%').height('16%').backgroundColor('#FFF')
        .position({x:"20%",y:"1%"})
        .borderRadius(12)
        .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })

        //右边卡片
        Row(){
          Column() {
            Row() {
              Image($r('app.media.Nvidia')).height('20%')
              Text('Nvidia')
                .margin({ left: '5%' })
              Text('+5.63').fontColor('#77B900')
                .margin({ left: '20%' })
            }
            Row() {
              Column() {
                Text('现行价格').fontColor('#838383')
                Text('$203.65').fontSize(20)
                  .margin({top:'2%'})
              }
              Image($r('app.media.nvidia_line'))
                .height('35%')
                .margin({left:'8%'})
            }.margin({ top: '8%' ,left:'10%'})
          }
        }.width('60%').height('16%').backgroundColor('#FFF')
          .position({x:"82%",y:"1%"})
          .borderRadius(12)
          .shadow({ radius: 5, color: 0xE0E0E0, offsetX: 1, offsetY: 1 })

      }.width('100%')

      Column() {
        Image($r('app.media.Stock_line'))
          .height('90%')
          .margin({top:'5%'})
      }
      .width('88%')
      .height('42%')
      .borderRadius(20)
      .backgroundColor('#FFF')
      .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      .position({x:"6%",y:"42%"})

      Row(){
        Button({type:ButtonType.Normal}){
          Text('<').fontColor('#FFF')

        }.width(44)
        .height(44)
        .borderRadius(8)
        .position({x:"4%",y:"24.5%"})
        .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })

        Button({type:ButtonType.Normal}){
          Text('>').fontColor('#FFF')

        }.width(44)
        .height(44)
        .borderRadius(8)
        .position({x:"84%",y:"24.5%"})
        .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      }
    }

  }
}