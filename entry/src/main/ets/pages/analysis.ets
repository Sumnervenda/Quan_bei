import router from '@ohos.router'
@Entry
@Component
struct Index {
  build() {
    Column({ space: 15 }) {
      // 趋势分析
      Column() {
        Row() {
          Text().width(6).height(20).borderRadius(10).backgroundColor('#007DFB')
          Text('趋势分析').fontSize(16).fontWeight(500).margin({ left: 10 })
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)

        Row() {
          Image($r('app.media.statistic')).width('100%').height('100%').objectFit(ImageFit.Cover)
        }
        .width('100%')
        .layoutWeight(1)
      }
      .width('88%')
      .height(270)
      .borderRadius(20)
      .backgroundColor('#FFF')
      .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      .padding({ top: 20, left: 20, right: 20 })
      .margin({ top: 40 })

      // 消费结构分析
      Column() {
        Row() {
          Text().width(6).height(20).borderRadius(10).backgroundColor('#007DFB')
          Text('消费结构分析').fontSize(16).fontWeight(500).margin({ left: 10 })
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)

        Row() {
          Stack() {
            Gauge({ value: 40, min: 0, max: 100 })
              .colors([['#4E97FF', 0.47], ['#026AFF', 0.2], ['#86B9FF', 0.23], ['#BED9FF', 0.4]])
              .strokeWidth(30)
              .width(200)
            Column({ space: 8 }) {
              Text('总支出').fontColor('#848A9C')
              Text('￥3,250.00').fontSize(20).fontWeight(700)
            }
          }
          .margin({ top: 8 })
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
      }
      .width('88%')
      .height(270)
      .borderRadius(20)
      .backgroundColor('#FFF')
      .shadow({ radius: 40, color: 0xE0E0E0, offsetX: -3, offsetY: 10 })
      .padding({ top: 20, left: 20, right: 20 })

      Column({ space: 12 }) {
        Row() {
          Column() {
            Text().width(12).height(12).borderRadius(6).backgroundColor('#D9D9D9')
          }
          Column({ space: 8 }) {
            Row({ space: 8 }) {
              Text('日用百货').fontWeight(600)
              Text('47%').fontColor('#717171').fontWeight(600)
            }

            Progress({ value: 80, total: 100 })
              .backgroundColor(Color.Transparent)
              .color('#026AFF')
              .style({
                strokeWidth: 10
              })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 25 })

        }
        .width('100%')
        .height(38)
        .alignItems(VerticalAlign.Bottom)
        Row() {
          Column() {
            Text().width(12).height(12).borderRadius(6).backgroundColor('#D9D9D9')
          }
          Column({ space: 8 }) {
            Row({ space: 8 }) {
              Text('教育培训').fontWeight(600)
              Text('40%').fontColor('#717171').fontWeight(600)
            }

            Progress({ value: 70, total: 100 })
              .backgroundColor(Color.Transparent)
              .color('#4E97FF')
              .style({
                strokeWidth: 10
              })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 25 })

        }
        .width('100%')
        .height(38)
        .alignItems(VerticalAlign.Bottom)
        Row() {
          Column() {
            Text().width(12).height(12).borderRadius(6).backgroundColor('#D9D9D9')
          }
          Column({ space: 8 }) {
            Row({ space: 8 }) {
              Text('服饰装扮').fontWeight(600)
              Text('23%').fontColor('#717171').fontWeight(600)
            }

            Progress({ value: 40, total: 100 })
              .backgroundColor(Color.Transparent)
              .color('#86B9FF')
              .style({
                strokeWidth: 10
              })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 25 })

        }
        .width('100%')
        .height(38)
        .alignItems(VerticalAlign.Bottom)
        Row() {
          Column() {
            Text().width(12).height(12).borderRadius(6).backgroundColor('#D9D9D9')
          }
          Column({ space: 8 }) {
            Row({ space: 8 }) {
              Text('数码电器').fontWeight(600)
              Text('20%').fontColor('#717171').fontWeight(600)
            }

            Progress({ value: 37, total: 100 })
              .backgroundColor(Color.Transparent)
              .color('#BED9FF')
              .style({
                strokeWidth: 10
              })
          }
          .alignItems(HorizontalAlign.Start)
          .margin({ left: 25 })

        }
        .width('100%')
        .height(38)
        .alignItems(VerticalAlign.Bottom)
      }
      .width('100%')
      .padding({ left: 40 })
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFF')
    .alignItems(HorizontalAlign.Center)
  }
}