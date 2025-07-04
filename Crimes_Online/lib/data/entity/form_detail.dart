class FormDetail {
  FormDetail({this.isHeader, this.header, this.title, this.desc, this.isAlert, this.isShowDialog}){
    if(this.desc!=null && this.desc!.length>40){
      this.isShowDialog=true;
    }
  }

  bool? isHeader;
  String? header;
  String? title;
  String? desc;
  bool? isAlert=false;
  bool? isShowDialog=false;
}
