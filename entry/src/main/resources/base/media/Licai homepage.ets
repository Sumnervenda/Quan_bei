@Entry
@Component
struct Investment {
  @State investmentList: ItemData[] = [
    {
      icon: $r('app.media.gupiao'),
      name: '股票'
    },
    {
      icon: $r('app.media.qihuo'),
      name: '期货'
    },
    {
      icon: $r('app.media.huangjin'),
      name: '黄金'
    },
    {
      icon: $r('app.media.waihui'),
      name: '外汇'
    },
    {
      icon: $r('app.media.xintuo'),
      name: '信托'
    },
    {
      icon: $r('app.media.qukuailian'),
      name: '区块链'
    }
  ]
  @State financialList: ItemData[] = [
    {
      icon: $r('app.media.chuxu'),
      name: '储蓄'
    },
    {
      icon: $r('app.media.guozhai'),
      name: '国债'
    },
    {
      icon: $r('app.media.jijin'),
      name: '基金'
    },
    {
      icon: $r('app.media.quanshang'),
      name: '券商'
    },
    {
      icon: $r('app.media.baoxian'),
      name: '保险'
    }
  ]


  @Builder itemBuilder(title: string, itemData: ItemData[]) {
    Column() {
      Row() {
        Text().width(6).height(20).borderRadius(10).backgroundColor('#007DFB')
        Text(title).fontSize(20).fontWeight(700).margin({ left: 8 })
      }
      .width('100%')
      .padding({left: 30})

      Grid() {
        ForEach(itemData, (item: ItemData, index: number) => {
          GridItem() {
            Column() {
              Row() {
                Image(item.icon).width(24).height(24)
              }
              .width(48)
              .height(48)
              .backgroundColor('#F7F7FC')
              .borderRadius(10)
              .justifyContent(FlexAlign.Center)
              .alignItems(VerticalAlign.Center)
              Text(item.name).fontColor('#344871').fontWeight(700)
                .margin({top: 15})
            }
            .padding({top: 16, bottom: 16, left: 25, right: 25})
            .shadow({ radius: 18, color: 0xE0E0E0, offsetX: -3, offsetY: 4 })
            .borderRadius(10)
            .backgroundColor('#fff')
            .width('100%')
          }
        })
      }
      .columnsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')
      .margin({top: 30})
      .padding({left: 30, right: 30})
    }
    .height(320)
  }

  build() {
    Column() {
      this.itemBuilder('投资理财',this.investmentList)
      this.itemBuilder('保守理财',this.financialList)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
    .margin({top: 100})
  }
}

class ItemData {
  icon: Resource
  name: string
}