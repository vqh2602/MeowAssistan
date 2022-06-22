
// kho du lieu 61
class TrieuChung{
  int Id;
  String name;
  int star;
  int group;
  TrieuChung({required this.Id,required this.name,required this.star, required this.group});
}


// 1 - triệu chưng khacs
// 2 - triệu chưng ben ngoai da
// 3- triệu chưng hệ Hô hấp
//4- triệu chưng hệ bài tiết & tiêu hoá
// 5 - triệu chưng hệ thần kinh
// 6 - triệu chưng van dong

List<TrieuChung> getListTrieuChung(int group) {
  List<TrieuChung> lst = [];

  switch(group){
    case 1:
      for (TrieuChung i in lstTrieuChung) {
        if (i.group == 1) {
          lst.add(i);
        }
      }
      return lst;
    case 2:
      for (TrieuChung i in lstTrieuChung) {
        if (i.group == 2) {
          lst.add(i);
        }
      }
      return lst;
    case 3:
      for (TrieuChung i in lstTrieuChung) {
        if (i.group == 3) {
          lst.add(i);
        }
      }
      return lst;
    case 4:
      for (TrieuChung i in lstTrieuChung) {
        if (i.group == 4) {
          lst.add(i);
        }
      }
      return lst;
    case 5:
      for (TrieuChung i in lstTrieuChung) {
        if (i.group == 5) {
          lst.add(i);
        }
      }
      return lst;
    case 6:
      for (TrieuChung i in lstTrieuChung) {
        if (i.group == 6) {
          lst.add(i);
        }
      }
      return lst;
    default: return lst;
  }
}

List<TrieuChung> lstTrieuChung = [
  TrieuChung(Id: 1, name: 'Biếng ăn, không ăn', star: 5,group: 1),
  TrieuChung(Id: 2, name: 'Mất nước, mất năng lượng', star: 5,group: 1),
  TrieuChung(Id: 3, name: 'Mất phương hướng', star: 5,group: 1),
  TrieuChung(Id: 4, name: 'Ăn, uống bị nôn', star: 5,group: 1),
  TrieuChung(Id: 5, name: 'Sốt', star: 5,group: 1),
  TrieuChung(Id: 6, name: 'Ăn, uống khó nuốt', star: 5,group: 1),
  TrieuChung(Id: 7, name: 'Kêu Grừ Grừ...', star: 5,group: 1),
  TrieuChung(Id: 8, name: 'Kêu meow quá mức', star: 5,group: 1),
  TrieuChung(Id: 9, name: 'Hung hăng', star: 5,group: 1),
  TrieuChung(Id: 10, name: 'Hoạt đông vào ban đêm', star: 5,group: 1),
  TrieuChung(Id: 11, name: 'Tránh xa người', star: 5,group: 1),
  TrieuChung(Id: 12, name: 'Phun nước tiểu', star: 5,group: 1),
  TrieuChung(Id: 13, name: 'Cai sữa không cho con bú', star: 5,group: 1),
  TrieuChung(Id: 14, name: 'Kêu khàn, mất giọng, kêu yếu', star: 5,group: 1),
  TrieuChung(Id: 15, name: 'Khát nước, thèm ăn nhiều', star: 5,group: 1),
  TrieuChung(Id: 16, name: 'Bụng sưng, phình to', star: 5,group: 2),
  TrieuChung(Id: 17, name: 'Gãi, liếm lông, da rất nhiều', star: 5,group: 2),
  TrieuChung(Id: 18, name: 'Mặt sưng', star: 5,group: 2),
  TrieuChung(Id: 19, name: 'Rụng lông', star: 5,group: 2),
  TrieuChung(Id: 20, name: 'Có u, bướu', star: 5,group: 2),
  TrieuChung(Id: 21, name: 'Da có vảy, tróc da', star: 5,group: 2),
  TrieuChung(Id: 22, name: 'Da ngứa, xước', star: 5,group: 2),
  TrieuChung(Id: 23, name: 'Da có mủ, chảy dịch', star: 5,group: 2),
  TrieuChung(Id: 24, name: 'Hôi miệng', star: 5,group: 3),
  TrieuChung(Id: 25, name: "Miệng bị đau", star: 5,group: 3),
  TrieuChung(Id: 26, name: "Chảy máu mũi", star: 5,group: 3),
  TrieuChung(Id: 27, name: "Xổ mũi, mũi chảy dịch", star: 5,group: 3),
  TrieuChung(Id: 28, name: "Thở bất thường", star: 5,group: 3),
  TrieuChung(Id: 29, name: "Nghẹt thở, khó thở", star: 5,group: 3),
  TrieuChung(Id: 30, name: "Ho", star: 5,group: 3),
  TrieuChung(Id: 31, name: "Chảy dãi", star: 5,group: 3),
  TrieuChung(Id: 32, name: "Tai chảy dịch", star: 5,group: 3),
  TrieuChung(Id: 33, name: "Gãi tai nhiều", star: 5,group: 3),
  TrieuChung(Id: 34, name: "Tai bị sưng", star: 5,group: 3),
  TrieuChung(Id: 35, name: 'Bụng đau', star: 5,group: 4),
  TrieuChung(Id: 36, name: "Máu trong phân", star: 5,group: 4),
  TrieuChung(Id: 37, name: "Máu trong nước tiểu", star: 5,group: 4),
  TrieuChung(Id: 38, name: "Táo bón", star: 5,group: 4),
  TrieuChung(Id: 39, name: "Đại tiện khó đi", star: 5,group: 4),
  TrieuChung(Id: 40, name: "Tiểu tiện không kiểm soát", star: 5,group: 4),
  TrieuChung(Id: 41, name: "Tiểu nhiều", star: 5,group: 4),
  TrieuChung(Id: 42, name: "Đi tiểu đau, khó", star: 5,group: 4),
  TrieuChung(Id: 43, name: "Tiêu chảy", star: 5,group: 4),
  TrieuChung(Id: 44, name: "Nôn ói", star: 5,group: 4),
  TrieuChung(Id: 45, name: "Đầy hơi", star: 5,group: 4),
  TrieuChung(Id: 46, name: 'Mắt chảy dịch, mủ, nhiều gèn', star: 5,group: 5),
  TrieuChung(Id: 47, name: "Đồng tử giãn", star: 5,group: 5),
  TrieuChung(Id: 48, name: "Mắt đỏ, sưng", star: 5,group: 5),
  TrieuChung(Id: 49, name: "Chảy nước mắt, nheo mắt", star: 5,group: 5),
  TrieuChung(Id: 50, name: 'Đi khập khiễng', star: 5,group: 6),
  TrieuChung(Id: 51, name: "Tê liệt", star:5,group: 6),
  TrieuChung(Id: 52, name: "Co giật", star: 5,group: 6),
  TrieuChung(Id: 53, name: "Loét miệng", star: 5,group: 3),
  TrieuChung(Id: 54, name: 'Kêu khàn, mất giọng, kêu yếu', star: 5,group: 1),
  TrieuChung(Id: 55, name: 'Khát nước, thèm ăn nhiều', star: 5,group: 1),
  TrieuChung(Id: 56, name: 'Béo phì', star: 5,group: 2),
  TrieuChung(Id: 57, name: 'Lười vận động, thể chất kém', star: 5,group: 1),
  TrieuChung(Id: 58, name: "Dịch nhầy trong phân", star: 5,group: 4),
  TrieuChung(Id: 59, name: "Miệng thâm đen", star: 5,group: 3),
  TrieuChung(Id: 60, name: 'Lắc Đầu', star: 5,group: 1),
  TrieuChung(Id: 61, name: 'Kích thước lớn bất thường', star: 5,group: 1),


];
//
// Map<String, dynamic> trieuChungKhac = {
//   "responseBody": [
//     {"id": 1, "name": "Biếng ăn, không ăn", "star": 5},
//     {"id": 2, "name": "Mất nước, mất năng lượng",  "star": 5},
//     {"id": 3, "name": "Mất phương hướng", "star": 5},
//     {"id": 4, "name": "Ăn, uống bị nôn", "star": 5},
//     {"id": 5, "name": "Sốt",  "star": 5},
//     {"id": 60, "name": "Lắc Đầu", "star": 5},
//     {"id": 61, "name": "Kích thước lớn bất thường", "star": 5},
//     {"id": 6, "name": "Ăn, uống khó nuốt",  "star": 5},
//     {"id": 7, "name": "Kêu Grừ Grừ...", "star": 5},
//     {"id": 8, "name": "Sụt cân", "star": 5},
//     {"id": 9, "name": "Kêu meow quá mức",  "star": 5},
//     {"id": 10, "name": "Hung hăng", "star": 5},
//     {"id": 11, "name": "Hoạt đông vào ban đêm", "star": 5},
//     {"id": 12, "name": "Tránh xa người",  "star": 5},
//     {"id": 13, "name": "Chơi đùa cắn xé, thô bạo", "star": 5},
//     {"id": 14, "name": "Phun nước tiểu", "star": 5},
//     {"id": 15, "name": "Cai sữa không cho con bú", "star": 5},
//     {"id": 54, "name": "Kêu khàn, mất giọng, kêu yếu", "star": 5},
//     {"id": 55, "name": "Khát nước, thèm ăn nhiều",  "star": 5},
//     {"id": 57, "name": "Lười vận động, thể chất kém", "star": 5},
//   ],
//   "responseTotalResult":
//   20 // Total result is 3 here becasue we have 3 categories in responseBody.
//   // Total result is 3 here becasue we have 3 categories in responseBody.
// };

// 2 - triệu chưng ben ngoai da


// Map<String, dynamic> trieuChungNgoaiDa = {
//   "responseBody": [
//     {"id": 16, "name": "Bụng sưng, phình to", "star": 5},
//     {"id": 17, "name": "Gãi, liếm lông, da rất nhiều",  "star": 5},
//     {"id": 18, "name": "Mặt sưng", "star": 5},
//     {"id": 19, "name": "Rụng lông", "star": 5},
//     {"id": 20, "name": "Có u, bướu",  "star": 5},
//     {"id": 21, "name": "Da có vảy, tróc da", "star": 5},
//     {"id": 22, "name": "Da ngứa, xước", "star": 5},
//     {"id": 23, "name": "Da có mủ, chảy dịch",  "star": 5},
//     {"id": 56, "name": "Béo phì", "star": 5},
//   ],
//   "responseTotalResult":
//   9
//   // Total result is 3 here becasue we have 3 categories in responseBody.
// };

// 3- triệu chưng hệ Hô hấp
// Map<String, dynamic> trieuChungHeHoHap = {
//   "responseBody": [
//     {"id": 24, "name": "Hôi miệng", "star": 5},
//     {"id": 25, "name": "Miệng bị đau",  "star": 5},
//     {"id": 59, "name": "Miệng thâm đen", "star": 5},
//     {"id": 53, "name": "Loét miệng", "star": 5},
//     {"id": 26, "name": "Chảy máu mũi",  "star": 5},
//     {"id": 27, "name": "Xổ mũi, mũi chảy dịch", "star": 5},
//     {"id": 28, "name": "Thở bất thường", "star": 5},
//     {"id": 29, "name": "Nghẹt thở, khó thở",  "star": 5},
//     {"id": 30, "name": "Ho", "star": 5},
//     {"id": 31, "name": "Chảy dãi", "star": 5},
//     {"id": 32, "name": "Tai chảy dịch",  "star": 5},
//     {"id": 33, "name": "Gãi tai nhiều", "star": 5},
//     {"id": 34, "name": "Tai bị sưng", "star": 5},
//   ],
//   "responseTotalResult":
//   13
//   // Total result is 3 here becasue we have 3 categories in responseBody.
// };

//4- triệu chưng hệ bài tiết & tiêu hoá

// Map<String, dynamic> trieuChungHeBaiTietTieuHoa = {
//   "responseBody": [
//     {"id": 35, "name": "Bụng đau", "star": 5},
//     {"id": 36, "name": "Máu trong phân",  "star": 5},
//     {"id": 37, "name": "Máu trong nước tiểu", "star": 5},
//     {"id": 38, "name": "Táo bón", "star": 5},
//     {"id": 39, "name": "Đại tiện khó đi",  "star": 5},
//     {"id": 40, "name": "Tiểu tiện không kiểm soát", "star": 5},
//     {"id": 41, "name": "Tiểu nhiều", "star": 5},
//     {"id": 42, "name": "Đi tiểu đau, khó",  "star": 5},
//     {"id": 43, "name": "Tiêu chảy", "star": 5},
//     {"id": 44, "name": "Nôn ói", "star": 5},
//     {"id": 45, "name": "Đầy hơi",  "star": 5},
//     {"id": 58, "name": "Dịch nhầy trong phân", "star": 5},
//   ],
//   "responseTotalResult":
//   12
//   // Total result is 3 here becasue we have 3 categories in responseBody.
// };

// 5 - triệu chưng hệ thần kinh


// Map<String, dynamic> trieuChungHeThanKinh = {
//   "responseBody": [
//     {"id": 46, "name": "Mắt chảy dịch, mủ, nhiều gèn", "star": 5},
//     {"id": 47, "name": "Đồng tử giãn",  "star": 5},
//     {"id": 48, "name": "Mắt đỏ, sưng", "star": 5},
//     {"id": 49, "name": "Chảy nước mắt, nheo mắt", "star": 5},
//   ],
//   "responseTotalResult":
//   4
//   // Total result is 3 here becasue we have 3 categories in responseBody.
// };

// 6 - triệu chưng van dong

List<TrieuChung> lstTrieuChungHeVanDong = [
  TrieuChung(Id: 50, name: 'Đi khập khiễng', star: 5,group: 6),
  TrieuChung(Id: 51, name: "Tê liệt", star:5,group: 6),
  TrieuChung(Id: 52, name: "Co giật", star: 5,group: 6)
];

// Map<String, dynamic> trieuChungHeVanDong = {
//   "responseBody": [
//     {"id": 50, "name": "Đi khập khiễng", "star": 5},
//     {"id": 51, "name": "Tê liệt",  "star": 5},
//     {"id": 52, "name": "Tê liệt", "star": 5},
//   ],
//   "responseTotalResult":
//   4
//   // Total result is 3 here becasue we have 3 categories in responseBody.
// };