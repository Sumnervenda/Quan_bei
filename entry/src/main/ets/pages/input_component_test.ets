/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {Piece_of_data} from '../Component/Piece_of_data'
import router from '@ohos.router';
/**
 * Home tab content
 */
@Entry
@Component
struct Home22 {
  private swiperController: SwiperController = new SwiperController();
  scroller: Scroller = new Scroller()

  build() {
    Stack() {

      List({space:8}) {
        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月12日',
            img_deal: $r('app.media.main_logo'), //参数如下
            deal_labels: '早餐',
            buy_labels: '堂食',
            money: '-36.0'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月13日',
            img_deal: $r('app.media.deal_img'),
            deal_labels: '午餐',
            buy_labels: '外卖',
            money: '-16.8'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月14日',
            img_deal: $r('app.media.icon'),
            deal_labels: '晚餐',
            buy_labels: '外卖',
            money: '-22.1'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月14日',
            img_deal: $r('app.media.deal_img'),
            deal_labels: '购物',
            buy_labels: '线上支付',
            money: '188.0'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月14日',
            img_deal: $r('app.media.icon'),
            deal_labels: '晚餐',
            buy_labels: '外卖',
            money: '-22.1'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月14日',
            img_deal: $r('app.media.icon'),
            deal_labels: '晚餐',
            buy_labels: '外卖',
            money: '-22.1'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月14日',
            img_deal: $r('app.media.icon'),
            deal_labels: '晚餐',
            buy_labels: '外卖',
            money: '-22.1'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月14日',
            img_deal: $r('app.media.icon'),
            deal_labels: '晚餐',
            buy_labels: '外卖',
            money: '-22.1'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月14日',
            img_deal: $r('app.media.icon'),
            deal_labels: '晚餐',
            buy_labels: '外卖',
            money: '-22.1'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月14日',
            img_deal: $r('app.media.icon'),
            deal_labels: '晚餐',
            buy_labels: '外卖',
            money: '-22.1'
          })
        }

        ListItem() {
          Piece_of_data({
            Date_mm_dd_week: '04月14日',
            img_deal: $r('app.media.icon'),
            deal_labels: '晚餐',
            buy_labels: '外卖',
            money: '-22.1'
          })
        }

        ListItem() {
          Row()
            .width('100%')
            .height(600)
        }

      }
      .edgeEffect(EdgeEffect.Spring)
      .onScroll((xOffset: number, yOffset: number) => {
        console.info(xOffset + ' ' + yOffset)
      })
      .width('100%')
      .alignListItem(ListItemAlign.Center)

      Image('assets/add_button.png') //添加一项新的事项按钮
        .width(80)
        .height(80)
        .margin({
          left: 256,
          top: 80
        })
        .onClick(() => {  //跳转到新的页面
          router.pushUrl({
            url: 'pages/index_jump_to_add'
          })
        })
        .position({ x: '75%', y: '80%' })


      Divider()//这个是分割线
        .strokeWidth(2)
        .color('#ff000000')
        .opacity(0.15)
        .position({ x: '0%', y: '99.9%' })


    }
  }

}
