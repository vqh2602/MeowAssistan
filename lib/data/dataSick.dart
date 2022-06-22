
// kho du lieu bệnh tật:
class BenhTat{
  int id;
  String name;
  int star;
  List<int> trieuChung;

  BenhTat({required this.id,required this.name,required this.star,required this.trieuChung});
}

class PhanTram{
  String name;
  double phantramtrung;
  PhanTram({required this.name,required this.phantramtrung});
}
// 1 - triệu chưng khacs
// 2 - triệu chưng ben ngoai da
// 3- triệu chưng hệ Hô hấp
//4- triệu chưng hệ bài tiết & tiêu hoá
// 5 - triệu chưng hệ thần kinh
// 6 - triệu chưng van dong

List<PhanTram> getBenhTatinTrieuChung(List<int> lstTChung,) {
  List<int> uniqueItemsList = [];
  List<String> lstS = [];
  int trung = 0;
  List<PhanTram> lstPT = [];
  for (BenhTat bt in lstBenhTat) {
    for (final i in bt.trieuChung) {
      for (final x in lstTChung) {
        if (i == x) {
          if(!uniqueItemsList.contains(i)){
            uniqueItemsList.add(i);
          }
          if(!lstS.contains(bt.name)){
            lstS.add(bt.name);
            lstPT.add(PhanTram(name: bt.name, phantramtrung: 1));
          }else{
            trung++;
            for(int a =0 ; a<lstPT.length; a++){
              if(lstPT[a].name == bt.name){
                lstPT[a].phantramtrung ++;
              }
            }
          }

        }
      }
    }
  }
  lstPT.sort((a, b) {
    double aDate = a.phantramtrung;
    double bDate = b.phantramtrung;
    return bDate.compareTo(aDate);
  });
    print('trùng: ${uniqueItemsList.toString()} | list: ${lstS.toString()} | %: $trung | đối tuong: ${lstPT[0].name}, ${(lstPT[0].phantramtrung*100 / (lstTChung.length))}' );

    return lstPT;
  }

  int getStar(String name){
    for(BenhTat bt in lstBenhTat){
      if(name == bt.name){
        return bt.star;
        break;
      }
    }return 0;
  }

List<BenhTat> lstBenhTat = [
  BenhTat(id: 1, name: 'Bệnh dại', star: 5, trieuChung:[1,7,10,13,31,30,44,43,51,5,47]),
  BenhTat(id: 2, name: 'Bệnh FeLV', star: 5, trieuChung:[53,1,8,19,29,28,2,5,43]),
  BenhTat(id: 3, name: 'Bệnh FPV', star: 5, trieuChung: [1,2,44,54,59,46,24]),
  BenhTat(id: 4, name: 'Bệnh nấm', star: 2, trieuChung: [17,22,19,21]),
  BenhTat(id: 5, name: 'Bệnh viêm phúc mạc', star: 5, trieuChung: [16,1,8,6,29,28]),
  BenhTat(id: 6, name: 'Suy thận', star: 5, trieuChung: [2,44,41,24,1]),
  BenhTat(id: 7, name: 'Bệnh FIV', star: 5, trieuChung: [5,23,21,28,27,48,49,43,32,34]),
  BenhTat(id: 8, name: 'Bệnh Chlamydia', star: 5, trieuChung: [26,27,46,49,5,28,29]),
  BenhTat(id: 9, name: 'Nội kí sinh trùng ', star: 4, trieuChung: [36,43,58,8,4,45]),
  BenhTat(id: 10, name: 'Ngoại kí sinh trùng', star: 2, trieuChung: [17,22,19]),
  BenhTat(id: 11, name: 'Rận tai', star: 2, trieuChung: [33,34,60]),
  BenhTat(id: 12, name: 'Viêm ruột, đại tràng', star: 4, trieuChung: [35,5,1,2,43,36]),
  BenhTat(id: 13, name: 'Bệnh Tiểu đường', star: 4, trieuChung: [41,55,56,57]),
  BenhTat(id: 14, name: 'Tắc ruột', star: 4, trieuChung: [35,16,38]),
  BenhTat(id: 15, name: 'Các bệnh đường tiết niệu', star: 4, trieuChung: [40,41,37,42]),
  BenhTat(id: 16, name: 'Dị ứng', star: 2, trieuChung: [17,21,22,30,27]),
  BenhTat(id: 17, name: 'Áp xe hoặc chấn thương nhẹ', star: 2, trieuChung: [18,50]),
  BenhTat(id: 18, name: 'Căng thẳng, lo lắng', star: 1, trieuChung: [19]),
  BenhTat(id: 19, name: 'Khối u béo, mụn', star: 1, trieuChung: [20,18]),
  BenhTat(id: 20, name: 'Đứt dây chằng chéo', star: 3, trieuChung: [50]),
];