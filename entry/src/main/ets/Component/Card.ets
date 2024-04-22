


@Component//定义一个组件，传入下列5个参数，组件内容会自动改变。
export struct Card{
  @State Title : string ='股票'
  @State Share_name : string = '圈贝控股'
  @State Change_rate : number = 0.46
  @State Share_price : string = '47.86'
  @State My_income : string = '+889%'
  @State Rate_color_red : string = "#c10f0f"
  @State Rate_color_green : string = '#20a000'
  @Styles img_style(){
    .width(50)
    .height(50)
  }

  build(){
    Column({space:12}) {
      Row(){
        Text(this.Title)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .textAlign(TextAlign.Start)
      }
      .width('100%')

      Row({space:8}){
        Text(this.Share_name)
          .fontSize(8)
          .fontWeight(FontWeight.Bold)

        Text(`${this.Change_rate}`)
          .fontColor(this.Change_rate>=0 ? this.Rate_color_red : this.Rate_color_green)
          .fontSize(8)

        Text(this.Share_price)
          .fontSize(8)

        Text(this.My_income)
          .fontSize(8)
          .fontColor('#006aff')

      }
      .width('100%')

      Row({space:8}){
        Text(this.Share_name)
          .fontSize(12)
          .fontWeight(FontWeight.Bold)

        Text(`${this.Change_rate}`)
          .fontColor(this.Change_rate>=0 ? this.Rate_color_red : this.Rate_color_green)
          .fontSize(12)

        Text(this.Share_price)
          .fontSize(12)

        Text(this.My_income)
          .fontSize(12)
          .fontColor('#006aff')

      }
      .width('100%')

      Row({space:8}){
        Text(this.Share_name)
          .fontSize(12)
          .fontWeight(FontWeight.Bold)

        Text(`${this.Change_rate}`)
          .fontColor(this.Change_rate>=0 ? this.Rate_color_red : this.Rate_color_green)
          .fontSize(12)

        Text(this.Share_price)
          .fontSize(12)

        Text(this.My_income)
          .fontSize(12)
          .fontColor('#006aff')

      }
      .width('100%')

    }
    .width('35%')
    .border({
      width:2
    })

  }

}