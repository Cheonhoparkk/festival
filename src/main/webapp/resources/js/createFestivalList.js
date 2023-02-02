// 축제 리스트를 json으로 받아오면 html로 만들어주는 함수
// 디자인 변경시 해당 부분 변경
function createList(jsonData) {
    if (!jsonData) {
        alert("데이터를 불러오지 못했습니다. 다시 시도합니다.");
        location.reload();
        return;
    }
    html = '';
    const body = document.querySelector('#tBody');
    for (let data of jsonData.list) {
        html += '<tr><td><img src="';
        if (data.firstimage2) {
            html += data.firstimage2;
        } else {
            html += '/resources/images/noimg.jpg'
        }
        html += '" height=125px></td><td><a href="/views/festivalInfo/viewItem?fiNum=' + data.fiNum + '">' + data.title + '</a></td><td>' + data.addr1 + '</td>';
        html += '<td>' + data.eventstartdate.substr(0, 4) + '년 ' + data.eventstartdate.substr(4, 2) + '월 ' + data.eventstartdate.substr(6, 2) + '일' + '</td><td>';
        html += data.eventenddate.substr(0, 4) + '년 ' + data.eventenddate.substr(4, 2) + '월 ' + data.eventenddate.substr(6, 2) + '일' + '</td></tr>';
    }
    body.insertAdjacentHTML('beforeend', html);
    document.querySelector('#totalNum').innerHTML = '총 ' + jsonData.total + ' 개의 축제가 검색되었습니다.';
    oneTime = false;
    document.querySelector('#page').value = Number(document.querySelector('#page').value) + 1;
}

// 축제 정보를 초기화하는 함수
function clearfestivalList() {
    document.querySelector('#tBody').innerHTML = '';
    document.querySelector('#page').value = 1;
}

// 축제 정보를 검색하기
function searchFestivalList() {
    clearfestivalList();
    loadFestivalList();
}

let oneTime = false; // 글로벌 변수

function YesScroll() {
    const pagination = document.querySelector('.paginaiton'); // 페이지네이션 정보획득
    const fullContent = document.querySelector('body'); // 전체를 둘러싼 컨텐츠 정보획득
    const screenHeight = screen.height; // 화면 크기
    document.addEventListener('scroll', OnScroll, { passive: true }) // 스크롤 이벤트함수정의
    function OnScroll() { //스크롤 이벤트 함수
        const fullHeight = fullContent.clientHeight; // 높이   
        const scrollPosition = pageYOffset; // 스크롤 위치
        if (fullHeight - screenHeight <= scrollPosition && !oneTime) { // 만약 전체높이-화면높이/2가 스크롤포지션보다 작아진다면, 그리고 oneTime 변수가 거짓이라면
            oneTime = true; // oneTime 변수를 true로 변경해주고,
            loadFestivalList(); // 컨텐츠를 추가하는 함수를 불러온다.
        }
    }
}
