# 📝 [JSP/Oracle] 개발 환경 구축 오류 해결 및 교훈 (실기 시험 대비)

JSP Dynamic Web Project와 Oracle Database 연동 과정에서 발생한 주요 빌드 에러 및 커넥션 오류에 대한 원인 분석과 재발 방지 가이드입니다.

---

## 🟥 1. Eclipse 소스 폴더 누락 에러 (Build Path Error)

### 🚨 현상 및 원인
* **에러 메시지**: `Project 'shop_30213' is missing required source folder: 'src/main/java'`
* **원인**: 프로젝트 빌드 경로(Build Path)가 요구하는 필수 자바 소스 디렉터리가 실제 구조상에 물리적으로 존재하지 않아 컴파일이 중단됨.

### 🛠️ 해결 지침
1. 프로젝트 우클릭 ➡️ `New` ➡️ `Folder` 선택.
2. 누락된 경로인 `src/main/java`를 직접 입력하여 생성.
3. 프로젝트 우클릭 ➡️ `Refresh (F5)` 후 상단 메뉴 `Project` ➡️ `Clean...` 실행하여 빌드 컨디션 초기화.

---

## 🟧 2. SQL 구문 에러 및 테이블 미존재 (ORA-00942)

### 🚨 현상 및 원인
* **에러 메시지**: `HTTP Status 500 – java.sql.SQLSyntaxErrorException: ORA-00942: table or view does not exist`
* **원인**: JSP 파일에서 `member_tbl_02` 테이블 조회를 시도했으나, 오라클 DB에 실제 테이블 생성이 되지 않았거나 이클립스와 데이터베이스 간의 연결(Connection)이 유실된 상태.

### 🛠️ 해결 지침
1. **커넥션 상태 확인**: `.sql` 편집창 상단의 연결 프로파일 상태가 `Status: Connected`인지 반드시 확인.
2. **스크립트 실행**: 작성된 `CREATE TABLE` 및 `INSERT INTO` 구문을 전체 드래그 후 우클릭 ➡️ `Execute Selected Text` 실행.
3. **영구 반영 (필수)**: 오라클은 트랜잭션 확정이 필요하므로 맨 아래에 `COMMIT;` 문장을 작성하고 해당 줄만 따로 긁어서 **한 번 더 실행**.

---

## 🟨 3. 오라클 드라이버 미인식 (ClassNotFoundException)

### 🚨 현상 및 원인
* **에러 메시지**: `java.lang.ClassNotFoundException: oracle.jdbc.OracleDriver`
* **원인**: 데이터베이스 커넥션 프로파일 생성 시, 이클립스가 오라클과 통신할 때 사용하는 다리 역할인 JDBC 드라이버 파일(`ojdbc6.jar` 등)의 유효한 경로를 찾지 못함.

### 🛠️ 해결 지침
1. `New Connection Profile` 설정 중 드라이버 정의 창 진입.
2. `JAR List` 탭에서 깨진 기존 라이브러리 경로를 `Remove` 처리.
3. `Add JAR/Zip...`을 통해 실제 로컬 PC 내 오라클 설치 경로 또는 프로젝트 내 보관된 정품 `ojdbc*.jar` 파일을 직접 명시.
4. **"A driver already exists with that name."** 에러 발생 시: `Name/Type` 탭으로 이동하여 기존 드라이버 이름 뒤에 숫자를 붙여 변경(`Oracle Thin Driver 2`)하면 중복 충돌을 회피하고 강제 신규 생성이 가능함.

---

## 💡 최종 요약 및 실무 교훈 (Lesson Learned)

* **코드 배치 규칙**: JSP 상단에는 반드시 한글 인코딩(`<%@ page ... charset=UTF-8 %>`) 처리가 최우선되어야 웹 페이지의 한글 깨짐을 예방할 수 있음.
* **주석 보안**: HTML 주석(`<!-- -->`)은 클라이언트의 `소스 보기` 시 개발자 코멘트가 그대로 노출되므로, 서버 내부에서만 소멸하는 **JSP 전용 주석(`<%-- --%>`)**을 사용하는 버릇을 들여야 함.
* **환경 점검 루틴**: 톰캣 서버에서 `500 에러` 발생 시 브라우저 화면의 **`Root Cause`** 항목을 가장 먼저 추적할 것. 대개 자바 문법 에러보다는 DB 미연결, 테이블 미생성, 드라이버 누락 등의 인프라 설정 문제가 대부분임.
