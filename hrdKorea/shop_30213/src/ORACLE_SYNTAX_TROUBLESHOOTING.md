# 📝 [Oracle/JSP] SQL 문법 오류(ORA-00923) 해결 보고서

JSP에서 복잡한 통계 및 조인(JOIN) 쿼리문을 작성하는 과정에서 발생한 오라클 구문 오류에 대한 원인 분석과 해결 지침입니다.

---

## 🟥 1. 오라클 FROM 키워드 누락 에러 (Syntax Error)

### 🚨 현상 및 원인
* **에러 메시지**: `HTTP Status 500 – java.sql.SQLSyntaxErrorException: ORA-00923: FROM keyword not found where expected`
* **원인**: 오라클 파서가 SQL 문을 해석하는 과정에서, 필수적인 구분 기호인 **쉼표(,)**가 누락되어 구문 분석 패턴이 깨짐. `FROM` 키워드가 엉뚱한 위치에 있거나 유실되었다고 판단할 때 발생하는 대표적인 문법 오류임.

### 🔍 기존 오류 코드 분석
```java
// ❌ me.custno와 me.custname 사이에 구분자(,)가 빠짐
String sql = "select me.custno me.custname, me.grade, sum(mo.price) as price "
    + "from member_tbl_02 me "
    + "join money_tbl_02 mo on me.custno = mo.custno "
    ...
```
* 위와 같이 작성하면 오라클은 `me.custname`을 `me.custno` 컬럼의 **별칭(Alias)**으로 인식합니다.
* 그 결과 바로 다음에 등장하는 `, me.grade` 부분을 해석하지 못해 에러를 발생시킵니다.

---

## 🛠️ 2. 해결 지침 및 수정 코드

자바 문자열로 SQL을 연결할 때는 컬럼 사이의 쉼표(`,`) 배치를 항상 교차 검증해야 합니다.

### ⭕ 수정된 표준 코드
```java
String sql = "select me.custno, me.custname, me.grade, sum(mo.price) as price " // 쉼표(,) 보완
    + "from member_tbl_02 me "
    + "join money_tbl_02 mo on me.custno = mo.custno "
    + "group by me.custno, me.custname, me.grade "
    + "order by price desc "; // 매출 기준 내림차순 정렬
```

### 🔄 조치 루틴
1. **문자열 쉼표 검사**: 다중 컬럼을 `SELECT` 할 때 나열된 모든 필드 사이에 `,`가 찍혔는지 확인합니다.
2. **자원 해제(Close)**: 데이터 루프가 끝난 직후 `rs.close();`, `pstmt.close();`를 수행하여 커넥션 풀 누수를 방지합니다. (시험 감점 방지 필수 요건)
3. **서버 반영**: JSP 내부의 자바 로직이나 SQL 문자열을 수정한 후에는 Tomcat 서버를 **`Restart`** 하거나 브라우저에서 **`Ctrl + F5`**(강제 새로고침)를 적용합니다.

---

## 💡 실전 예방 팁 (Lesson Learned)

* **줄바꿈 공백 확보**: 문자열을 더하기 연산자(`+`)로 연결할 때는 각 줄의 맨 끝 또는 맨 시작점에 반드시 **공백(Space)**을 한 칸씩 두어야 문장이 붙어버리는 2차 구문 오류를 예방할 수 있습니다.
* **디버깅 습관**: 복잡한 대형 쿼리는 JSP에 바로 타이핑하지 말고, 이클립스의 `.sql` 편집창이나 디벨로퍼에서 **먼저 독립적으로 실행하여 `Success`를 확인**한 뒤 복사해 오는 것이 개발 시간을 대폭 단축하는 지름길입니다.
