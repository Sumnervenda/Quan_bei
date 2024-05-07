import router from '@ohos.router'
import {Card_new} from '../Component/Card_new'

@Entry
@Component
export default struct Manage_money  {
  @State message: string = '这是Home'
  @State place_holder: string ='这是搜索'
  @State widthSize: string = '100%'
  @State heightSize: number = 35
  @State flag:Boolean = true
  @State change:string=''

  build() {
    Row() {
      Column() {
        Row() {
          //构建搜索框
          Search({ value: this.change, placeholder: this.place_holder })
            .height(this.heightSize)
            .width(this.widthSize)
            .searchButton('SEARCH')
            .align(Alignment.End)
            .margin({top:30})
        }
        .align(Alignment.TopStart)
        .alignItems(VerticalAlign.Center)
        .width('85%')

        //投资理财文本
        Row(){
          Row() {
            Divider()//这是左侧的蓝色条条
              .vertical(true)
              .strokeWidth(6)
              .color('#00000000')
              .backgroundColor('#007DFB')
              .borderRadius(12)
            Text('投资理财')
              .margin({
                left:6
              })
          }
          .height(20)
          .width('85%')
        }
        .margin({
          top:45
        })
        //六个卡片
        Row(){
          Column({space:6}){
            Card_new({
              Title:'股票',
              img_url:$r('app.media.gupiao_')
            })
              .onClick(()=>{router.pushUrl({
              url:'pages/Share_info'
            })
            })
            Card_new({
              Title:'外汇',
              img_url:$r('app.media.waihui_')
            })
          }
          Column({space:6}){
            Card_new({
              Title:'期货',
              img_url:$r('app.media.qihuo_')
            })
            Card_new({
              Title:'信托',
              img_url:$r('app.media.xintuo_')
            })
          }
          Column({space:6}){
            Card_new({
              Title:'黄金',
              img_url:$r('app.media.huangjin_')
            })
            Card_new({
              Title:'区块链',
              img_url:$r('app.media.qukuailian_')
            })
          }
        }
        .margin({
          top:30
        })
        .width('85%')
        .justifyContent(FlexAlign.SpaceBetween)

        //保守理财
        Row(){
          Row() {
            Divider()//这是左侧的小条条
              .vertical(true)
              .strokeWidth(6)
              .color('#00000000')
              .backgroundColor('#007DFB')
              .borderRadius(12)
            Text('保守理财')
              .margin({
                left:6
              })
          }
          .height(20)
          .width('85%')
        }
        .margin({
          top:20
        })
        //5张卡片，可以scroll，还没实现
        Row(){
          Column({space:6}){
            Card_new({
              Title:'储蓄',
              img_url:$r('app.media.chuxu_')
            })

            Card_new({
              Title:'券商',
              img_url:$r('app.media.quanshang_')
            })
          }
          Column({space:6}){
            Card_new({
              Title:'国债',
              img_url:$r('app.media.guozhai_')
            })
            Card_new({
              Title:'保险',
              img_url:$r('app.media.baoxian_')
            })
          }
          Column({space:6}){
            Card_new({
              Title:'基金',
              img_url:$r('app.media.jijin_')
            })
            Row()
              .width(96)
              .height(96)
          }


        }
        .margin({
          top:30
        })
        .width('85%')
        .justifyContent(FlexAlign.SpaceBetween)
           //这是分割线
        Divider()
          .strokeWidth(2)
          .color('#ff000000')
          .opacity(0.15)
          .position({x:'0%',y:'99.9%'})
      }
      .width('100%')
      .height('100%')


    }
    .width('100%')
    .height('100%')
  }
}