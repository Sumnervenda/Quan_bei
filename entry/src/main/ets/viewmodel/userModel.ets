export class UserModel{
  action:string
  accountType:number
  date_now:string
  typeText:string
  accountPrompt:string
  amount:number

  constructor(action:string,accountType:number,date_now:string,typeText:string,accountPrompt:string,amount:number) {
    this.action=action
    this.accountType=accountType
    this.date_now=date_now
    this.typeText=typeText
    this.accountPrompt=accountPrompt
    this.amount=amount
  }
}