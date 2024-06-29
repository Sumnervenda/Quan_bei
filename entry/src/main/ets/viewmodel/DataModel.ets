/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import Logger from '../common/Logger';
import http from '@ohos.net.http';
const TAG = '[DataModel]';
import UIAbility from '@ohos.app.ability.UIAbility';
/**
 * Saving and manipulating data displayed on the page.
 */


export class DataModel {

  /**
   * Saved data.
   */
  private targetData: Array<TaskItemBean> = [];



  initData():Array<TaskItemBean> {

    const stringdata2={
      action:"read_all",
      id:"15",
      accountType:"1",
      date_now:"2024-6-25",
      typeText:"交通运输",
      accountPrompt:"123",
      amount:"123"
    }
    const formBody = Object.keys(stringdata2).map(key =>
    encodeURIComponent(key) + '=' + encodeURIComponent(stringdata2[key])
    ).join('&');
    let httpRequest = http.createHttp();
    httpRequest.request(
      "https://hkf.cccxwm.chat/insert.php",
      {
        method:http.RequestMethod.POST,
        header: {
          "Content-Type": "application/x-www-form-urlencoded"
        },
        extraData:formBody

      },(err, data: http.HttpResponse) => {
      if (!err) {
          let resultArray = JSON.parse(data.result.toString());
        let length=resultArray.length;
        for(let i=0;i<length;i++){
          let piecedata=new TaskItemBean(1," "," "," "," ",true)
          piecedata.id=resultArray[i].id;
          console.log("初始化录入的主键id为"+resultArray[i].id.toString())
          if(resultArray[i].accountType==1){
            piecedata.flag=true;
          }else{
            piecedata.flag=false;
          }
          piecedata.date_picker=resultArray[i].date_now;
          piecedata.spend_type=resultArray[i].typeText;
          piecedata.spend_money=resultArray[i].amount.toString();
          piecedata.deal_name=resultArray[i].accountPrompt;
          this.targetData.push(piecedata)
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
    // console.log("222333"+this.targetData[2].date_picker.toString())

    return this.targetData;
  }


  /**
   * Get the latest data.
   */
  getData(): Array<TaskItemBean> {

    return this.targetData;
  }

  /**
   * Delete the selected data.
   *
   * @param selectArr: An array indicating whether historical data is selected.
   */
  deleteData(selectArr: Array<boolean>) {
    if (!selectArr) {
      Logger.error(TAG, 'Failed to delete data because selectArr is ' + selectArr);
    }
    let dataLen = this.targetData.length - 1;

    for (let i = dataLen; i >= 0; i--) {
      if (selectArr[i]) {
        let indexid=this.targetData[i].id;
        this.targetData.splice(i, 1);
        const stringdata2={
          action:"delete",
          id:String(indexid),
          accountType:"1",
          date_now:"2024-6-25",
          typeText:"交通运输",
          accountPrompt:"123",
          amount:"123"
        }
        console.log("主键id是"+indexid.toString())
        const formBody = Object.keys(stringdata2).map(key =>
        encodeURIComponent(key) + '=' + encodeURIComponent(stringdata2[key])
        ).join('&');
        let httpRequest = http.createHttp();
        httpRequest.request(
          "https://hkf.cccxwm.chat/insert.php",
          {
            method:http.RequestMethod.POST,
            header: {
              "Content-Type": "application/x-www-form-urlencoded"
            },
            extraData:formBody

          },(err, data: http.HttpResponse) => {
          if (!err) {
        console.log("result"+JSON.stringify(data.result))

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

      }
    }
  }

  /**
   * Add data to targetData.
   *
   * @param Data of the RecordItemBean type to be added.
   */
  addData(data: TaskItemBean) {

      Logger.error(TAG, 'addData error because data is: ' + data);
      let type=1;
      if(data.flag){
        type=1;
      }else{
        type=0;
      }
      const stringdata2={
        action:"create",
        accountType:type,
        date_now:data.date_picker,
        typeText:data.spend_type,
        accountPrompt:data.deal_name,
        amount:Number(data.spend_money)
      }
      const stringdata3={
        action:"read_all",
        accountType:type,
        date_now:data.date_picker,
        typeText:data.spend_type,
        accountPrompt:data.deal_name,
        amount:Number(data.spend_money)
      }
      const formBody = Object.keys(stringdata2).map(key =>
      encodeURIComponent(key) + '=' + encodeURIComponent(stringdata2[key])
      ).join('&');
      const formBody2 = Object.keys(stringdata3).map(key =>
      encodeURIComponent(key) + '=' + encodeURIComponent(stringdata3[key])
      ).join('&');
      let httpRequest = http.createHttp();
      httpRequest.request(
        "https://hkf.cccxwm.chat/insert.php",
        {
          method:http.RequestMethod.POST,
          header: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          extraData:formBody

        },(err, result: http.HttpResponse) => {
        if (!err) {
      console.log("result"+JSON.stringify(result.result));
    }

  });

      let httpRequest2 = http.createHttp();
      httpRequest2.request(
        "https://hkf.cccxwm.chat/insert.php",
        {
          method:http.RequestMethod.POST,
          header: {
            "Content-Type": "application/x-www-form-urlencoded"
          },
          extraData:formBody2

        },(err, result: http.HttpResponse) => {
        if (!err) {
          console.log("result"+JSON.stringify(result.result));
          let resultArray = JSON.parse(result.result.toString());
          let length=resultArray.length;
          data.id=resultArray[length-1].id;
          console.log("成功录入data的id："+data.id.toString())
          console.log("数据库的主键id："+resultArray[length-1].id.toString())
        }

      });

    this.targetData.push(data);
  }

  /**
   * Get the latest progress.
   */
  // getLatestProgressValue(): number {
  //   if (this.targetData.length === 0) {
  //     return 0;
  //   }
  //   return this.targetData[this.targetData.length - CommonConstants.ONE_TASK].progressValue;
  // }

  /**
   * Update data based on index and progress values and update date.
   *
   * @param index of update item.
   * @param updateValue of update item.
   * @param updateDate of update item.
   //  */
  // updateProgress(index: number, updateValue: number, updateDate: string): boolean {
  //   if (!this.targetData[index]) {
  //     return false;
  //   }
  //   this.targetData[index].progressValue = updateValue;
  //   this.targetData[index].updateDate = updateDate;
  //   return true;
  // }
}

export default new DataModel();

/**
 * Task item entity class.
 */
@Observed
export class TaskItemBean {
  /**
   * Progress value of task item.
   */
  id:number
  spend_type: string;
  spend_money :string;
  date_picker: string;
  deal_name : string;
  flag :boolean


  /**
   * progress value of task item.
   */


  /**
   * Construction method.
   *
   * @param progressValue progress value.
   * @param updateDate update time.
   */
  constructor(id:number,spend_type: string,spend_money :string,date_picker: string, deal_name : string, flag :boolean) {
    this.id=id;
    this.spend_type = spend_type;
    this.spend_money = spend_money;
    this.date_picker = date_picker;
    this.deal_name = deal_name;
    this.flag = flag
  }
}

