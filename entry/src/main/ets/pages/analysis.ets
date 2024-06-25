import router from '@ohos.router'
import http from '@ohos.net.http';

const categories = [
  { type: '饮食消费', min: 0.40, max: 0.60 },
  { type: '娱乐消费', max: 0.30 },
  { type: '学习消费', max: 0.08 },
  { type: '日用品消费', max: 0.15 },
  { type: '交通运输', max: 0.10 },
  { type: '服装消费', max: 0.15 }
];//消费占比端点值

const suggestions = {
  '饮食消费': {
    low: '合理安排饮食，保持营养均衡，在有限的预算内，你可以探索更多经济实惠且健康的饮食选择，这对你的现在和未来都是一笔宝贵的财富。',
    high: '在享受美食的同时，也不要忘记合理规划和控制预算。学会平衡口味与经济，可以让你的饮食生活更加健康和可持续。'
  },
  '娱乐消费': {
    high: '娱乐是生活的调味品，但适度消费才能确保生活的主菜——学业和个人发展不受影响。在享受精彩生活的同时，也不要忘了未来的长远规划。'
  },
  '学习消费': {
    high: '投资于自己的教育和学习是非常宝贵的，它将为你的未来打下坚实的基础。但也要注意合理分配资源，确保每一分钱都花在刀刃上，实现学习效益的最大化。'
  },
  '日用品消费': {
    high: '在日常生活中，选择性价比高的日用品，合理规划消费，不仅可以节省开支，还能培养良好的消费习惯和理财能力。'
  },
  '交通运输': {
    high: '合理规划出行路线和时间，选择性价比高的交通方式，不仅能有效控制开支，还能培养良好的时间管理能力和环保意识。'
  },
  '服装消费': {
    high: '时尚是表达个性的方式，但理智消费和追求持久风格同样重要。在追求潮流的同时，也要注重服装的实用性和质量，以确保每一分钱都花得值得。'
  }
};//消费建议



@Component
export default  struct analysis {
  @State type:Array<string> = []
  @State amount:Array<number>=[]
  @State value1:number =5
  @State value2:number =6
  @State value3:number =7
  @State value4:number =7
  @State value5:number =7
  @State value6:number =7
  @State value7:number =7
  @State total:number = 0

  @State suggest:string=""






  build() {
    List({space:15}){
      ListItem() {

        // 趋势分析
        Column() {
          Row() {
            Text().width(6).height(20).borderRadius(10).backgroundColor('#007DFB')
            Text('趋势分析').fontSize(16).fontWeight(500).margin({ left: 10 })
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)

          Row() {
            Image($r('app.media.analysis_pic')).width('100%').height('100%').objectFit(ImageFit.Cover)
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
      }
      ListItem() {

        // 消费结构分析
        Column() {
          Row() {
            Text().width(6).height(20).borderRadius(10).backgroundColor('#007DFB')
            Text('消费结构分析').fontSize(16).fontWeight(500).margin({ left: 10 })
            Blank()
            Button("刷新").height(24)
              .onClick(()=>{
                let httpRequest = http.createHttp();
                httpRequest.request(
                  "https://hkf.cccxwm.chat/select_all.php",
                  {
                    method:http.RequestMethod.GET,
                    header: {
                      "Content-Type": "application/JSON"
                    },

                  },(err, data: http.HttpResponse) => {
                  if (!err) {
                    console.log("汇总结果result"+JSON.stringify(data.result))
                    let resultArray= JSON.parse(data.result.toString());
                    console.log("汇总结果result"+resultArray[0])
                    console.log("汇总结果result"+resultArray[0].total_amount)
                    for(let i=0;i<7;i++){
                      this.type.push(resultArray[i].typeText);
                      this.amount.push(Number(resultArray[i].total_amount));
                    }
                    this.value1=this.amount[0];
                    this.value2=this.amount[1];
                    this.value3=this.amount[2];
                    this.value4=this.amount[3];
                    this.value5=this.amount[4];
                    this.value6=this.amount[5];
                    this.value7=this.amount[6];
                    this.total=this.value1+this.value2+this.value3+this.value4+this.value5+this.value6+this.value7
                    console.log("结果为"+this.amount[5])

                    for (let i = 0; i < this.type.length; i++) {
                      let proportion = this.amount[i] / this.total;
                      let category = categories.find(cat => cat.type === this.type[i]);

                      console.log(`消费类型: ${this.type[i]}, 占比: ${(proportion * 100).toFixed(2)}%`);
                      this.suggest=this.suggest+'\n'+`消费类型: ${this.type[i]}, 占比: ${(proportion * 100).toFixed(2)}%`

                      if (category) {
                        if (category.min && proportion < category.min) {
                          console.log(`超低：${suggestions[this.type[i]].low}`);
                          this.suggest=this.suggest+'\n'+`超低：${suggestions[this.type[i]].low}`
                        } else if (category.max && proportion > category.max) {
                          console.log(`超高：${suggestions[this.type[i]].high}`);
                          this.suggest=this.suggest+'\n'+`超高：${suggestions[this.type[i]].high}`
                        } else {
                          console.log(`${this.type[i]}在正常范围内。`);
                          this.suggest=this.suggest+'\n'+`${this.type[i]}在正常范围内。`
                        }
                      } else {
                        console.log(`${this.type[i]}无相关建议。`);
                        this.suggest=this.suggest+'\n'+`${this.type[i]}无相关建议。`
                      }
                    }


                    httpRequest.off('headersReceive');
                    // 当该请求使用完毕时，开发者务必调用destroy方法主动销毁该JavaScript Object。
                    httpRequest.destroy();
                  } else {
                    console.log('error:' + JSON.stringify(err));
                    // 取消订阅HTTP响应头事件
                    httpRequest.off('headersReceive');
                    // 当该请求使用完毕时，开发者务必调用destroy方法主动销毁该JavaScript Object。
                    httpRequest.destroy();
                  }
                }
                );

              })
          }
          .width('100%')
          .justifyContent(FlexAlign.Start)

          Row() {
            Stack() {
              Gauge({ value: 40, min: 0, max: 100 })
                // .colors([['#4E97FF', this.amount[0]],
                //   ['#026AFF',this.amount[1]],
                //   ['#86B9FF', this.amount[2]],
                //   ['#BED9FF', this.amount[3]],
                // ['#ffcfe3ff', this.amount[4]],
                //   ['#ffdbe8ff', this.amount[5]],
                //   ['#ffeff5ff', this.amount[6]]])

                .colors([["#66ccff",this.value1],["#ff37bdff",this.value2],["#ff08abff",this.value3],
                  ["#ffa166ff",this.value4],["#ff8437ff",this.value5],["#ff5e08ff",this.value6],
                  ["#ffff66d4",this.value7]])
                .animation({
                  duration: 1200,
                  curve: Curve.Sharp
                })
                .strokeWidth(30)
                .width(200)

              // Text(typeof(this.amount[2]))
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


      }
      ListItem(){
        Text(this.suggest).width("88%")


      }
      ListItem(){
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
      }
    .width('100%')
    .listDirection(Axis.Vertical)
    .alignListItem(ListItemAlign.Center)
    }

}