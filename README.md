# Bank Deposit Segmentation Analysis

## 1. GIỚI THIỆU

Dự án này tập trung vào việc phân tích dữ liệu liên quan đến các tài khoản tiết kiệm của khách hàng tại ngân hàng. Bộ dữ liệu cung cấp một cái nhìn sâu rộng về các yếu tố chính liên quan đến quản lý tiền gửi, bao gồm: mã khách hàng, ngày gửi, ngày đáo hạn, lãi suất, số tiền gửi, số tiền lãi phát sinh, và trạng thái hiện tại của tài khoản tiết kiệm. Mỗi yếu tố trong dữ liệu đều đóng một vai trò quan trọng trong việc hiểu rõ cấu trúc vốn huy động và hành vi tài chính của khách hàng. Dưới đây là những điểm nổi bật:

- **Ngày gửi và ngày đáo hạn**: Hai trường dữ liệu này cung cấp thông tin về chu kỳ thời gian của từng khoản tiền gửi. Ngày gửi là ngày mà khách hàng bắt đầu gửi tiền vào tài khoản, trong khi ngày đáo hạn là thời điểm khoản tiền gửi đó hết kỳ hạn và có thể được tất toán hoặc tái tục.

- **Lãi suất**: Đây là yếu tố quan trọng ảnh hưởng trực tiếp đến quyết định gửi tiền của khách hàng và khả năng sinh lời từ tiền gửi. Lãi suất có thể thay đổi tùy theo thời hạn gửi và các điều kiện khác.

- **Số tiền gửi và tiền lãi**: Số tiền ban đầu khách hàng gửi vào tài khoản tiết kiệm và lãi suất từ khoản tiền đó qua từng kỳ hạn. Đây là những chỉ số quan trọng để đánh giá mức độ tham gia của khách hàng vào các sản phẩm tiết kiệm và đóng góp vào nguồn vốn huy động của ngân hàng.

- **Tự động gia hạn**: Một số tài khoản có tính năng tự động gia hạn khi đến hạn, cho phép khách hàng tiếp tục kỳ hạn mới mà không cần phải tái đầu tư thủ công. Điều này giúp ngân hàng có thêm sự ổn định về vốn huy động trong dài hạn.

## 2. MỤC TIÊU DỰ ÁN

Mục tiêu chính của dự án này là tối ưu hóa việc quản lý nguồn vốn huy động từ các tài khoản tiết kiệm và xây dựng các mô hình dự báo nhu cầu thanh khoản cho ngân hàng. Thông qua việc phân tích hành vi tiền gửi của khách hàng, dự án sẽ cung cấp các thông tin quan trọng để:

- **Dự báo nhu cầu thanh khoản**: Bằng cách phân tích các chu kỳ gửi tiền và thời điểm đáo hạn, ngân hàng có thể dự báo chính xác hơn về lượng tiền cần chuẩn bị để đáp ứng nhu cầu rút tiền của khách hàng vào các thời điểm khác nhau.

- **Tối ưu hóa lãi suất và sản phẩm tiết kiệm**: Phân tích dữ liệu về lãi suất sẽ giúp ngân hàng đánh giá được mức độ cạnh tranh của các sản phẩm hiện tại, từ đó tối ưu hóa lãi suất để thu hút thêm khách hàng và đồng thời duy trì sự cân bằng trong việc chi trả lãi suất.

- **Phân tích hành vi khách hàng**: Thông qua việc theo dõi số tiền gửi, thời gian gửi, và các lựa chọn tự động gia hạn, ngân hàng có thể phân nhóm khách hàng dựa trên quy mô tiền gửi, thói quen sử dụng sản phẩm, và mức độ tin tưởng vào sản phẩm tiết kiệm. Điều này sẽ giúp đề xuất các chiến lược marketing và dịch vụ khách hàng phù hợp hơn.

- **Đề xuất các sản phẩm tiết kiệm mới**: Thông qua việc hiểu rõ nhu cầu và hành vi của khách hàng, ngân hàng có thể phát triển và cung cấp các sản phẩm tiết kiệm mới phù hợp với từng nhóm đối tượng, từ đó tăng cường khả năng huy động vốn trong tương lai.

## 3. ĐỌC HIỂU DỮ LIỆU

| **Tên Trường** | **Kiểu Dữ Liệu** | **Mô tả** |
| --- | --- | --- |
| Cust_ID | NVARCHAR(12) | Mã khách hàng do hệ thống cấp khi tạo mới. |
| Saving_account_ID | NVARCHAR(12) | Mã tài khoản tiết kiệm do hệ thống tạo tự động. |
| Sav_date | Date | Ngày mở tài khoản tiết kiệm. |
| Sav_end_date | Date | Ngày đáo hạn tài khoản tiết kiệm. |
| Interest | Numeric(5,2) | Lãi suất, định dạng hai chữ số thập phân. |
| Value | Numeric(18,0) | Số tiền khách hàng gửi ban đầu. |
| Sotien_lai | Numeric(18,0) | Số tiền lãi ngân hàng phải trả cho khách hàng. |
| Sotien_thucnhan | Numeric(18,0) | Tổng số tiền khách hàng nhận được khi đến hạn. |
| Auto_extend | Int | Tài khoản có tự động gia hạn không: 0 - Không, 1 - Có. |
| Status | Int | Trạng thái tài khoản: 0 - Chưa tất toán, 1 - Đã tất toán. |
| Withdraw_day | Date | Ngày khách hàng rút tiền thực tế. |

## 4. CÁC BÀI TOÁN ĐẶT RA

## BÀI TOÁN 1: Báo cáo Huy động Vốn trong 6 tháng đầu năm
- **Mô tả**: Sử dụng truy vấn SQL để tạo báo cáo huy động vốn, phân tích xu hướng mở mới và tất toán tài khoản tiết kiệm trong nửa đầu năm 2024.
- **Truy vấn**: Xem tại BAOCAO_HUYDONGVON.sql
- **Kết quả**:

| **STT** | **Nội dung** | **31/12/2023** | **Mở mới Quý I 2024** | **Tất toán Quý I 2024** | **Mở mới Quý II 2024** | **Tất toán Quý II 2024** | **30/06/2024** |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | Số khoản tiết kiệm | 11 | 25 | 2 | 24 | 3 | 55 |
| 2 | Số lượng khách hàng | 7 | 19 | 0 | 8 | 0 | 34 |
| 3 | Tổng tiền tiết kiệm | 4.424.952.249 | 56.175.392.000 | 900.000.000 | 17.133.670.000 | 650.000.000 | 76.184.014.249 |

- **Phân tích**:
**Số lượng tài khoản tiết kiệm**
- Vào thời điểm đầu kỳ (ngày 31-12-2023), ngân hàng ghi nhận có 11 tài khoản tiết kiệm đang hoạt động. Tuy nhiên, trong quý 1/2024, số lượng tài khoản đã tăng mạnh khi 25 tài khoản mới được mở, trong khi chỉ có 2 tài khoản được tất toán. Đến cuối quý 1, số lượng tài khoản đã tăng lên 34. Xu hướng tăng trưởng tiếp tục duy trì trong quý 2/2024, với thêm 24 tài khoản mới được mở và 3 tài khoản được tất toán. Đến hết tháng 6/2024, tổng số tài khoản tiết kiệm của ngân hàng đã đạt con số 55.

- **Insight**: Từ phân tích dữ liệu, có thể thấy rõ một xu hướng tích cực khi số lượng tài khoản tiết kiệm tăng liên tục qua từng quý. Điều này cho thấy ngân hàng đã thực hiện thành công các chiến lược thu hút khách hàng mới và khuyến khích khách hàng duy trì khoản tiền gửi của mình, với số tài khoản tăng từ 11 lên 55 chỉ trong vòng 6 tháng. Điều này cũng gợi mở khả năng ngân hàng có thể đang tận dụng các chương trình khuyến mãi, hoặc cải thiện các sản phẩm tiết kiệm để thu hút khách hàng.

**Số lượng khách hàng**
- Vào đầu kỳ, ngân hàng có 7 khách hàng. Trong quý 1/2024, 19 khách hàng mới đã được thêm vào, không có trường hợp tất toán nào xảy ra. Tương tự, trong quý 2/2024, thêm 8 khách hàng mới tham gia, đưa tổng số khách hàng lên con số 34 vào cuối tháng 6/2024.

- **Insight**: Số lượng khách hàng tăng trưởng ổn định và không có dấu hiệu sụt giảm trong suốt giai đoạn 6 tháng đầu năm 2024. Sự gia tăng số lượng khách hàng gấp gần 5 lần so với đầu năm cho thấy ngân hàng đã thu hút hiệu quả khách hàng mới. Điều này có thể là kết quả từ các chiến dịch tiếp thị mạnh mẽ hoặc sự thay đổi tích cực trong các dịch vụ chăm sóc khách hàng và sản phẩm tiết kiệm. Điều đáng chú ý là không có khách hàng nào tất toán tài khoản trong giai đoạn này, một tín hiệu cho thấy sự hài lòng và mức độ tin tưởng cao của khách hàng với ngân hàng.

**Tổng số tiền tiết kiệm**
- Số dư tiền gửi tiết kiệm bắt đầu với 4.42 tỷ VND vào cuối năm 2023. Trong quý 1/2024, ngân hàng đã huy động thêm 56.18 tỷ VND từ các khoản tiền gửi mới và tất toán 900 triệu VND, nâng tổng số tiền tiết kiệm lên 59.70 tỷ VND vào cuối quý. Đến quý 2/2024, ngân hàng tiếp tục thu hút thêm 17.13 tỷ VND, với 650 triệu VND được tất toán, đưa tổng số tiền tiết kiệm lên mức 76.18 tỷ VND vào cuối tháng 6/2024.

- **Insight**: Tổng số tiền tiết kiệm đã tăng một cách vượt bậc, từ 4.42 tỷ VND lên 76.18 tỷ VND trong vòng 6 tháng, điều này phản ánh rõ ràng xu hướng gia tăng đáng kể về vốn huy động. Việc thu hút một lượng lớn tiền gửi mới, với hơn 73 tỷ VND tiền gửi thêm vào trong giai đoạn này, là dấu hiệu rõ ràng cho thấy khách hàng có niềm tin lớn vào sự ổn định và mức lãi suất hấp dẫn mà ngân hàng đang cung cấp. Đây cũng là minh chứng cho sự hiệu quả của các chiến lược huy động vốn mà ngân hàng đã triển khai, đồng thời phản ánh sức mạnh tài chính ngày càng tăng của ngân hàng.

**Kết luận và Nhận xét**
- Dữ liệu phân tích từ 6 tháng đầu năm 2024 cho thấy một xu hướng tăng trưởng rất tích cực trong hoạt động huy động vốn của ngân hàng. Cả về số lượng tài khoản tiết kiệm, số lượng khách hàng, và tổng số tiền tiết kiệm đều tăng một cách mạnh mẽ, đặc biệt là sự tăng trưởng gấp gần 5 lần trong số lượng khách hàng và số tiền tiết kiệm tăng lên hơn 17 lần. Những con số này cho thấy ngân hàng không chỉ thành công trong việc thu hút khách hàng mới mà còn duy trì được lòng trung thành của khách hàng hiện tại, nhờ các sản phẩm và dịch vụ chất lượng cao.

- Sự tăng trưởng đáng kể này phản ánh chiến lược kinh doanh hiệu quả của ngân hàng, đặc biệt là trong bối cảnh cạnh tranh khốc liệt của thị trường tài chính. Ngân hàng cần tiếp tục tận dụng đà tăng trưởng này, đồng thời xem xét các yếu tố thị trường có thể tác động đến hành vi khách hàng trong tương lai, để điều chỉnh chiến lược huy động vốn và sản phẩm tiết kiệm sao cho phù hợp và bền vững hơn.

## BÀI TOÁN 2: Báo cáo Tình hình Tất Toán trong 6 tháng đầu năm 2024
- **Truy vấn**: Xem tại BAOCAO_TATTOAN.sql
- **Kết quả**:

| **TIÊU CHÍ** | **Quý I** | **Quý II** | **Quý III** | **Quý IV** |
| --- | --- | --- | --- | --- |
| Số tiền gốc phải trả | 900,000,000 | 650,000,000 | 1,131,709,472 | 1,041,764,834 |
| Số tiền lãi phải trả | 192,672,000 | 60,535,397 | 95,909,301 | 86,181,066 |
| Tổng | 1,092,672,000 | 710,535,397 | 1,227,618,773 | 1,127,945,900 |

- **Phân tích**:
**Số tiền gốc phải thanh toán**:
- Trong Quý I, số tiền gốc phải thanh toán là 900 triệu VND. Đến Quý II, số tiền này giảm xuống còn 650 triệu VND, tương đương mức giảm 27%. Tuy nhiên, đến Quý III, số tiền gốc phải thanh toán tăng mạnh lên 1.13 tỷ VND, tức tăng 74% so với Quý II. Đến Quý IV, số tiền này giảm nhẹ còn 1.04 tỷ VND.

- **Nhận xét**: Biến động lớn trong số tiền gốc phải thanh toán, đặc biệt là sự tăng mạnh vào Quý III, có thể phản ánh những thay đổi trong kỳ hạn của các khoản tiền gửi, hoặc việc gia hạn các khoản tiền gửi lớn đến hạn. Điều này cho thấy có thể ngân hàng đang quản lý các khoản vốn huy động lớn với nhiều kỳ hạn khác nhau, và lượng vốn thanh toán trong từng kỳ phụ thuộc vào nhu cầu rút vốn của khách hàng.

**Số tiền lãi phải thanh toán**:
- Số tiền lãi phải thanh toán trong Quý I là 192.672 triệu VND, nhưng giảm mạnh xuống còn 60.535 triệu VND trong Quý II, tương đương mức giảm 69%. Trong Quý III và Quý IV, số tiền lãi lại tăng lần lượt lên 95.909 triệu VND và 86.181 triệu VND.

- **Nhận xét**: Việc giảm mạnh tiền lãi trong Quý II có thể là do lượng lớn tài khoản tiền gửi đã đến hạn tất toán trong Quý I, dẫn đến số dư vốn huy động trong Quý II giảm, kéo theo lãi phải trả giảm. Sự tăng trở lại trong các Quý III và IV cho thấy khả năng ngân hàng đã huy động thêm được nguồn vốn mới với lãi suất cao hơn hoặc thời hạn dài hơn, điều này có thể là do các chương trình khuyến mãi hoặc lãi suất hấp dẫn đã thu hút lượng tiền gửi mới từ khách hàng.

**Tổng số tiền phải thanh toán (gốc + lãi)**:
- Tổng số tiền thanh toán trong Quý I là 1.09 tỷ VND, giảm mạnh xuống 710 triệu VND trong Quý II, tức giảm 35%. Đến Quý III, tổng số tiền thanh toán tăng trở lại lên 1.23 tỷ VND, sau đó giảm nhẹ còn 1.13 tỷ VND trong Quý IV.

- **Nhận xét**: Tổng số tiền thanh toán thấp nhất trong Quý II cho thấy áp lực tài chính của ngân hàng giảm trong giai đoạn này. Điều này có thể liên quan đến việc ngân hàng đã thanh toán các khoản lớn trong Quý I, làm giảm nhu cầu thanh toán trong Quý II. Tuy nhiên, áp lực tài chính lại tăng lên trong nửa cuối năm do sự gia tăng vốn huy động mới và lượng vốn đến hạn cần tất toán. Đây có thể là dấu hiệu của việc ngân hàng đẩy mạnh chiến lược huy động vốn trong nửa sau của năm nhằm chuẩn bị cho các mục tiêu tài chính dài hạn.

**Kết luận**:

Qua phân tích, có thể thấy rằng tình hình thanh toán vốn huy động của ngân hàng trong nửa đầu năm 2024 đã có những biến động lớn. Số tiền thanh toán gốc và lãi có xu hướng giảm mạnh trong Quý II nhưng sau đó tăng trở lại vào các Quý tiếp theo. Điều này có thể cho thấy ngân hàng đang trong giai đoạn tái cơ cấu vốn huy động, với chiến lược quản lý dòng tiền chặt chẽ nhằm duy trì sự cân đối giữa dòng tiền vào và ra. Những biến động này cho thấy ngân hàng cần có những điều chỉnh linh hoạt để đảm bảo tính thanh khoản và tối ưu hóa chi phí vốn.

## BÀI TOÁN 3: Báo cáo phân loại theo giá trị tài khoản tiết kiệm
- **Truy vấn**: Xem tại BAOCAO_PHANLOAI_GIATRITKTK.sql
- **Kết quả**:

| **Phân loại** | **Số tài khoản tiết kiệm** | **Số tiền tiết kiệm** |
| --- | --- | --- |
| Dưới 1 tỷ | 35 | 9,759,062,000 |
| Từ 1 tỷ đến 10 tỷ | 13 | 48,550,000,000 |
| Từ 10 tỷ đến 50 tỷ | 1 | 15,000,000,000 |

**Phân tích**:
Dữ liệu phân loại tài khoản tiết kiệm theo giá trị cho thấy một xu hướng tập trung tài chính rõ ràng:
+ Tài khoản dưới 1 tỷ VND: Có 35 tài khoản, chiếm 71% tổng số tài khoản, nhưng chỉ đóng góp 13% vào tổng số tiền tiết kiệm (9.759 tỷ VND).
+ Tài khoản từ 1 đến 10 tỷ VND: Gồm 13 tài khoản (27% tổng số tài khoản), đóng góp 66% vào tổng số tiền tiết kiệm (48.550 tỷ VND).
+ Tài khoản từ 10 đến 50 tỷ VND: Chỉ có 1 tài khoản (chiếm 2%), nhưng nắm giữ tới 21% tổng số tiền tiết kiệm (15 tỷ VND).
**Insight**: Mặc dù phần lớn các tài khoản tiết kiệm có giá trị nhỏ dưới 1 tỷ VND, chúng đóng góp rất ít vào tổng số tiền tiết kiệm của ngân hàng. Trong khi đó, một lượng nhỏ tài khoản có giá trị lớn từ 1 tỷ đến 50 tỷ VND lại chiếm phần lớn tổng số tiền tiết kiệm. Điều này cho thấy sự tập trung tài sản cao trong một nhóm nhỏ khách hàng giàu có, trong khi phần lớn khách hàng chỉ nắm giữ các khoản tiết kiệm nhỏ lẻ. Đây là một tín hiệu quan trọng cho ngân hàng trong việc xác định chiến lược huy động vốn, khi các khách hàng lớn có thể đóng vai trò quan trọng trong việc ổn định nguồn vốn dài hạn.

## 5. KẾT LUẬN

Kết quả phân tích cho thấy rằng tiền gửi tại ngân hàng được phân bổ không đồng đều giữa các phân khúc tài khoản. Cụ thể, dù tài khoản dưới 1 tỷ VND chiếm tỷ lệ lớn về số lượng (71% tổng số tài khoản), nhưng chỉ đóng góp 13% vào tổng số tiền gửi. Trong khi đó, các tài khoản có số dư từ 1 đến 10 tỷ VND, mặc dù chỉ chiếm 27% tổng số tài khoản, lại chiếm đến 66% tổng số tiền gửi. Đặc biệt, chỉ có duy nhất một tài khoản thuộc phân khúc từ 10 đến 50 tỷ VND nhưng đã đóng góp tới 21% tổng số tiền gửi.

Sự tập trung vốn ở một nhóm khách hàng nhỏ: Phân tích chỉ ra rằng phần lớn vốn huy động của ngân hàng đang tập trung vào một nhóm khách hàng có số dư tài khoản lớn, trong khi nhóm tài khoản nhỏ chiếm đa số nhưng đóng góp rất ít vào tổng vốn huy động. Điều này cho thấy sự phụ thuộc cao vào một số ít khách hàng có số dư lớn, đồng thời tạo ra rủi ro về tính thanh khoản nếu những khách hàng này rút vốn đột ngột.

Tiềm năng khai thác từ phân khúc nhỏ hơn: Ngân hàng cần xem xét các chiến lược thu hút và phát triển các khách hàng nhỏ hơn. Dù họ đóng góp ít về giá trị vốn huy động hiện tại, nhưng việc mở rộng số lượng tài khoản nhỏ với các chính sách phù hợp có thể giúp ngân hàng đa dạng hóa nguồn vốn và giảm thiểu rủi ro tập trung.

Chiến lược giữ chân khách hàng lớn: Để đảm bảo nguồn vốn lớn từ các khách hàng có số dư cao, ngân hàng nên tập trung vào việc duy trì mối quan hệ tốt với nhóm khách hàng này thông qua các chương trình ưu đãi và chăm sóc khách hàng đặc biệt. Đồng thời, việc phát triển các sản phẩm huy động vốn linh hoạt, lãi suất cạnh tranh cũng sẽ giúp ngân hàng tăng cường thu hút thêm các khoản tiền gửi lớn từ các cá nhân và doanh nghiệp.

## 6. TỔNG KẾT

Ngân hàng đang có một cơ cấu tiền gửi với sự phân bố không cân đối giữa các phân khúc tài khoản. Để duy trì và phát triển bền vững, ngân hàng cần có chiến lược linh hoạt, vừa giữ vững nguồn vốn từ các khách hàng lớn, vừa thúc đẩy mở rộng quy mô ở phân khúc khách hàng nhỏ hơn. Điều này không chỉ giúp tăng trưởng vốn huy động mà còn giảm thiểu các rủi ro tiềm ẩn về thanh khoản trong dài hạn.
