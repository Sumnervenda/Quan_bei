
@Component
export struct Share_data{
  @State Share_name : string = '圈贝控股'
  @State Change_rate : number = 0.46
  @State Share_price : string = '47.86'
  @State My_income : string = '+889%'
  @State Rate_color_red : string = "#c10f0f"
  @State Rate_color_green : string = '#20a000'

  build() {
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
  }
}