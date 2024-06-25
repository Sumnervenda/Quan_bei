import router from '@ohos.router'
@Component
export default struct Mine {
  @State message: string = '这是Home'
  @State place_holder: string = '这是搜索'
  @State widthSize: string = '100%'
  @State heightSize: number = 35
  @State flag: Boolean = true
  @State change: string = ''

  build() {
    Column(){
      Text('我的')
        .width('92%')
        .align(Alignment.Start)
        .margin({
          left: 20,
          top:20
        })
        .fontSize(24)
        .fontWeight(FontWeight.Bold)

      //何坤坤
      Row(){
        Image($r('app.media.bule_head'))
          .height('80%')
          .margin({top:2,left:20})

        Text('何坤坤')
          .fontSize(22)
          .margin({top:4,left:12})
          .fontWeight(FontWeight.Medium)

        Image($r('app.media.row_right'))
          .height('40%')
          .margin({top:2,left:100})

      }.width('88%')
      .height('10%')
      .borderRadius(10)
      .backgroundColor('#FFF')
      .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      .position({x:"6%",y:"10%"})
      .onClick(() => {
        router.pushUrl({
          url:'pages/UserInfoPage'
        })
      })

      //总资产
      Column(){
        Row(){
          Text('总资产（元）')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#717171')

          Text('昨日收益（元）')
            .fontWeight(FontWeight.Medium)
            .fontColor('#717171')
            .margin({left:64})

        }.margin({top:16})

        Row(){
          Text('15754.28')
            .fontSize(28)
            .fontWeight(FontWeight.Bold)

          Text('+154.60')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF0000')
            .margin({left:80})
        }.margin({top:20})
      }
      .width('88%')
      .height('14%')
      .borderRadius(10)
      .backgroundColor('#FFF')
      .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      .position({x:"6%",y:"22%"})
      .onClick(() => {
        router.pushUrl({
          url: 'pages/MyAssetPage'
        })
      })

      //实名认证、支付设置
      Column(){
        Row(){
          Text('实名认证')
            .fontSize(20)
            .fontWeight(FontWeight.Medium)

          Image($r('app.media.row_right'))
            .height('20%')
            .margin({left:160})

        }.margin({top:20,left:20})

        Row(){
          Text('支付设置')
            .fontSize(20)
            .fontWeight(FontWeight.Medium)

          Image($r('app.media.row_right'))
            .height('20%')
            .margin({left:160})

        }.margin({top:20,left:20})

        Row(){
          Text('授权管理')
            .fontSize(20)
            .fontWeight(FontWeight.Medium)

          Image($r('app.media.row_right'))
            .height('20%')
            .margin({top:4,left:160})

        }.margin({top:20,left:20})
      }
      .width('88%')
      .height('24%')
      .borderRadius(10)
      .backgroundColor('#FFF')
      .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      .position({x:"6%",y:"38%"})

      //隐私管理
      Row(){
        Text('隐私管理')
          .fontSize(20)
          .margin({top:2,left:20})
          .fontWeight(FontWeight.Medium)

        Image($r('app.media.row_right'))
          .height('40%')
          .margin({left:160})
      }
      .width('88%')
      .height('8%')
      .borderRadius(10)
      .backgroundColor('#FFF')
      .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      .position({x:"6%",y:"66%"})

      //账号与安全
      Row(){
        Row(){
          Text('账号与安全')
            .fontSize(20)
            .margin({top:2,left:20})
            .fontWeight(FontWeight.Medium)

          Image($r('app.media.row_right'))
            .height('40%')
            .margin({left:140})
        }
      }
      .width('88%')
      .height('8%')
      .borderRadius(10)
      .backgroundColor('#FFF')
      .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      .position({x:"6%",y:"76%"})
      .onClick(() => {
        router.pushUrl({
          url:'pages/AccountSafePage'
        })
      })

      //关于
      Row(){
        Row(){
          Text('关于')
            .fontSize(20)
            .margin({top:2,left:20})
            .fontWeight(FontWeight.Medium)

          Image($r('app.media.row_right'))
            .height('40%')
            .margin({left:200})
        }
      }
      .width('88%')
      .height('8%')
      .borderRadius(10)
      .backgroundColor('#FFF')
      .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      .position({x:"6%",y:"86%"})
    }
    .width('100%')
    .height('100%')
  }
}