import 'package:puzzel/puzzle_game_3/widget/question_model.dart';

final Map<int, String> answers = {
  0: 'HANHTRINH',
  1: 'GIAMGIA',
  2: 'KHUHOI',
  3: 'CHUYENDI',
  4: 'DIENTU',
  5: 'XINVE',
  6: 'TONGTIEN',
  7: 'XACNHAN',
  8: 'XOAHET',
  9: 'HOANTIEN',
  10: 'THONGTIN',
  11: 'AGENTCODE',
  12: 'MADATCHO',
  13: 'MATVE',
};

const String keyAnswer = 'NGUYENTHANHNAM';

final Map<String, Map<String, int>> questionsAndLengthAnswer = {
  '0': {
    'Trong hệ thống vé tàu, thông tin bao gồm ga đi, ga đến, mã tàu, giờ đi, giờ đến thuộc phần nào?':
        9
  },
  '1': {'Hệ thống áp dụng mức gì cho trẻ em và người cao tuổi khi đặt vé?': 7},
  '2': {'Loại vé áp dụng cho cả lượt đi và lượt về ': 6},
  '3': {'Một chiều là loại vé chỉ áp dụng cho hướng nào? ': 8},
  '4': {'Sau khi thanh toán, hệ thống gửi về vé dưới dạng nào?': 6},
  '5': {'Thao tác đầu tiên người dùng cần thực hiện để có thể đặt được vé.': 5},
  '6': {
    'Thông tin bắt buộc người dùng kiểm tra trước khi xác nhận thanh toán.': 8
  },
  '7': {
    'Để đảm bảo mọi thông tin được kiểm tra kỹ trước khi thanh toán và xuất vé người dùng cần thực hiện thao tác gì?':
        7
  },
  '8': {'Nút thao tác để xóa toàn bộ vé đã chọn trong giỏ vé.': 6},
  '9': {'Khi hủy vé hợp lệ, hệ thống sẽ thực thiện bước gì cho người dùng?': 8},
  '10': {
    'Mọi thao tác nhập dữ liệu trên hệ thống đều được hiển thị và cập nhật dưới phần nào?':
        8
  },
  '11': {
    'Trên vé điện tử, mã gì dùng để nhận biết đại lý thực hiện đặt vé?': 9
  },
  '12': {
    'Một trong những điều kiện người dùng cần nhập để tra cứu thông tin vé.': 8
  },
  '13': {
    'Người dùng có thể tùy chỉnh phần hiển thị trên bản in thông qua chức năng nào?':
        5
  },
};

List<Question> questionsContent = [
  Question(
    questionText:
        "Để em bé-infant có thể đi cùng mẹ trên 1 chuyến bay nội địa nhưng không có giấy khai sinh bản gốc. Có thể sử dụng giấy tờ thay thế nào sau đây?",
    options: [
      "A. VNeID của mẹ có đăng kí phụ thuộc cho bé vào tên mẹ",
      "B. Ảnh chụp giấy khai sinh bản gốc",
      "C. VNeID của mẹ có đăng kí phụ thuộc cho bé vào tên mẹ và mẹ là chủ hộ",
      "D. Giấy xác nhận nhân thân xác nhận trong 6 tháng"
    ],
    correctOption: "C",
  ),
  Question(
    questionText:
        "Có bao nhiêu cách nhập tên hành khách bay trên hệ thống airdata",
    options: ["A.5", "B.4", "C.3", "D.2"],
    correctOption: "B",
  ),
  Question(
    questionText:
        "Hiện tại có tất cả bao nhiêu loại nhân viên trên hệ thống Airdata",
    options: ["A. 4", "B. 5", "C. 6", "D. 7"],
    correctOption: "C",
  ),
  Question(
    questionText:
        "Thời điểm đóng cửa khởi hành (boarding gate) chặng nội địa thường là:",
    options: [
      "A. 30 phút trước giờ bay",
      "B. 20 phút trước giờ bay",
      "C. 15 phút trước giờ bay",
      "D. 10 phút trước giờ bay"
    ],
    correctOption: "C",
  ),
  Question(
    questionText: "Dịch vụ trẻ đi một mình - UMNR có thể bay khi :",
    options: [
      "A. Đăng ký dịch vụ tại phòng vé của hãng",
      "B. Đặt vé trên Airdata",
      "C. Cần bố mẹ ký giấy ở cổng để được phép bay",
      "D. Chỉ áp dụng trên đường bay quốc tế"
    ],
    correctOption: "A",
  ),
  Question(
    questionText: "Ghế hàng thoát hiểm (exit row) thường không bố trí cho:",
    options: [
      "A. Hành khách ≥60 tuổi",
      "B. Hành khách mang thai giai đoạn sớm",
      "C. Hành khách có thẻ thành viên hội viên hạng cao",
      "D. Hành khách <15 tuổi"
    ],
    correctOption: "D",
  ),
  Question(
    questionText: "Pin sạc dự phòng (power bank) được mang:",
    options: [
      "A. Chỉ xách tay, ≤100 Wh",
      "B. Chỉ ký gửi, ≤100 Wh",
      "C. Tự do, không giới hạn",
      "D. Có thể mang ở cả xách tay hoặc ký gửi"
    ],
    correctOption: "A",
  ),
  Question(
    questionText: "Hành khách mang thai – quy định phổ biến:",
    options: [
      "A. Mọi giai đoạn mang thai đều cần giấy khám bác sĩ",
      "B. Từ ~28–36 tuần cần giấy bác sĩ",
      "C. Cần ký cam kết trước khi bay",
      "D. Cần đặt dịch vụ riêng"
    ],
    correctOption: "B",
  ),
  Question(
    questionText:
        "Trường hợp chuyến bay bị delay, cần đổi lên chuyến bay khung giờ sớm hơn miễn phí, bạn nên thực hiện:",
    options: [
      "A. Dùng tính năng đổi chuyến bay trên Airdata hỗ trợ khách hàng",
      "B. Không đổi được miễn phí",
      "C. Khách tự xử lý",
      "D. Gọi tổng đài báo đổi chuyến hỗ trợ khách hàng"
    ],
    correctOption: "D",
  ),
];

final List<String> hiddenImagePath = [
  'assets/images/hid_img1.png',
  'assets/images/hid_img8.png',
  'assets/images/hid_img5.png',
  'assets/images/hid_img3.png',
  'assets/images/hid_img2.png',
  'assets/images/hid_img6.png',
  'assets/images/hid_img7.png',
  'assets/images/hid_img8.png',
  'assets/images/hid_img4.png',
];
