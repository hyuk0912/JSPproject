
// 라이엇 공식 API발급키
api_key = "RGAPI-ddc13ec8-ac41-44a1-95e3-03d4b85ed5fd";

// summoner info //
id = "";
accountId = "";
puuid = "";
profileIconId = "";
IconPath = "";
summonerLevel = "";
cnt = 0;

// league info //
// solo info
soloLeagueId = "";
soloQueueType= "";
soloTier= "";
soloRank= "";
soloSummonerId= "";
soloSummonerName= "";
soloLeaguePoints= "";
soloWins= "";
soloLosses= "";
// flex info
flexLeagueId= "";
flexQueueType= "";
flexTier= "";
flexRank= "";
flexSummonerId = "";
flexSummonerName= "";
flexLeaguePoints= "";
flexWins= "";
flexLosses= "";

// champion_mastery info //
championId = new Array();
championLevel= new Array();
championPoints= new Array();
summonerId= new Array(); //soloSummonerId 와 같음

// matchlist 10개만 //
mlist_gameId= new Array(); // 중요! --> 이 값으로 게임 자세한 정보 get
mlist_champion= new Array(); // 해당소환사가 플레이한 챔피언 번호
mlist_queue= new Array(); // 게임종류(일반,칼바람,솔랭,자유랭 등)
mlist_timestamp= new Array(); //시간

// 게임종류 이름 매핑(일반,칼바람,솔랭,자유랭 등)
mapLabel = "";
mapType = "";
mapName = "";

// matches 10개 //
matches_queueId = new Array(); // 이걸로 전부확인 솔랭 일반 urf 등등
matches_participants = new Array();
matches_spell1Id = new Array();
matches_spell2Id = new Array();

// 승패여부(win:false or true), 구매아이템(item0~item6), 킬/데스/어시(kills,deaths,assists), 총챔피언딜량(totalDamageDealtToChampions), 와드수(wardsPlaced),
matches_stats = new Array(); // matches_stats[10판][0]:false/true [1]:
matches_win = new Array(); // 10판 각판마다 이겻는지
matches_kills = new Array(); 
matches_deaths = new Array(); 
matches_assists = new Array(); 
matches_buyItem = new Array();

matches_participantIdentities = new Array(); // 10명중에 한명한명 정보
for (var i = 0; i < 11; i++) {
   matches_participants[i] = new Array();
   matches_participantIdentities[i] = new Array();
   matches_stats[i] = new Array();
   matches_buyItem[i] = new Array();
   for(var j=0; j < 11; j++){
      matches_participants[i][j] = new Array();
      matches_participantIdentities[i][j] = new Array(); // 3차원배엵
   }
}

spellImgPath1 = "";
spellImgPath2 = "";

itemImgPath0 = "";
itemImgPath1 = "";
itemImgPath2 = "";
itemImgPath3 = "";
itemImgPath4 = "";
itemImgPath5 = "";
itemImgPath6 = "";

result = "";


//소환사 기본정보 json url

if(search_id != null)
   summonerUrl = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/"   + search_id + "?api_key=" + api_key;
//해당 소환사의 랭크(솔로,자유) 정보 url
leagueUrl = "";
//해당 소환사 모스트 챔피언 10개 url(숙련도기준)
champion_masteryUrl = "";
//해당 소환사 최근 게임 10판만 url
matchListUrl = "";
//검색한 게임 1판에 대한 정보 url 10판
matchesUrl = new Array();


// 챔피언 번호 매핑 셋팅
champMap = {
   1:'애니',
   2:'올라프',
    3:'갈리오',
    4:'트위스티드페이트',
    5:'신짜오',
    6:'우르곳',
    7:'르블랑',
    8:'블라디미르',
    9:'피들스틱',
    10:'케일',
    11:'마스터 이',
    12:'알리스타',
    13:'라이즈',
    14:'사이온',
    15:'시비르',
    16:'소라카',
    17:'티모',
    18:'트리스타나',
    19:'워윅',
    20:'누누와윌럼프',
    21:'미스포춘',
    22:'애쉬',
    23:'트린다미어',
    24:'잭스',
    25:'모르가나',
    26:'질리언',
    27:'신지드',
    28:'이블린',
    29:'트위치',
    30:'카서스',
    31:'초가스',
    32:'아무무',
    33:'람머스',
    34:'애니비아',
    35:'샤코',
    36:'문도박사',
    37:'소나',
    38:'카사딘',
    39:'이렐리아',
    40:'잔나',
    41:'갱플랭크',
    42:'코르키',
    43:'카르마',
    44:'타릭',
    45:'베이가',
    48:'트런들',
    50:'스웨인',
    51:'케이틀린',
    53:'블리츠크랭크',
    54:'말파이트',
    55:'카타리나',
    56:'녹턴',
    57:'마오카이',
    58:'레넥톤',
    59:'자르반4세',
    60:'엘리스',
    61:'오리아나',
    62:'오공',
    63:'브랜드',
    64:'리신',
    67:'베인',
    68:'럼블',
    69:'카시오페아',
    72:'스카너',
    74:'하이머딩거',
    75:'나서스',
    76:'니달리',
    77:'우디르',
    78:'뽀삐',
    79:'그라가스',
    80:'판테온',
    81:'이즈리얼',
    82:'모데카이저',
    83:'요릭',
    84:'아칼리',
    85:'케넨',
    86:'가렌',
    89:'레오나',
    90:'말자하',
    91:'탈론',
    92:'리븐',
    96:'코그모',
    98:'쉔',
    99:'럭스',
    101:'제라스',
    102:'쉬바나',
    103:'아리',
    104:'그레이브즈',
    105:'피즈',
    106:'볼리베어',
    107:'렝가',
    110:'바루스',
    111:'노틸러스',
    112:'빅토르',
    113:'세주아니',
    114:'피오라',
    115:'직스',
    117:'룰루',
    119:'드레이븐',
    120:'헤카림',
    121:'카직스',
    122:'다리우스',
    126:'제이스',
    127:'리산드라',
    131:'다이애나',
    133:'퀸',
    134:'신드라',
    136:'아우렐리온 솔',
    141:'케인',
    142:'조이',
    143:'자이라',
    145:'카이사',
    147:'세라핀',
    150:'나르',
    154:'자크',
    157:'야스오',
    161:'벨코즈',
    163:'탈리야',
    164:'카밀',
    201:'브라움',
    202:'진',
    203:'킨드레드',
    222:'징크스',
    223:'탐켄치',
    235:'세나',
    236:'루시안',
    238:'제드',
    240:'클레드',
    245:'에코',
    246:'키아나',
    254:'바이',
    266:'아트록스',
    267:'나미',
    268:'아지르',
    350:'유미',
    360:'사미라',
    412:'쓰레쉬',
    420:'일라오이',
    421:'렉사이',
    427:'아이번',
    429:'칼리스타',
    432:'바드',
    497:'라칸',
    498:'자야',
    516:'오른',
    517:'사일러스',
    518:'니코',
    523:'아펠리오스',
    555:'파이크',
    777:'요네',
    875:'세트',
    876:'릴리아'
}


// 처음 소환사 기본정보 및 다른정보 얻을 때 필요한 id값들 get
function ajaxDefault(){
	$.ajax({
		//async:false,
		type : "GET",
		url : summonerUrl,
		cache : false,
		dataType : "JSON",
		success : function(data, status) {
			if (status == "success")
				parseJSON(data);
			cnt = cnt + 1;
			ajax(leagueUrl);					
		},
		error : function(request,status,error) {
			/*alert("1==> code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);*/
			if(request.status == 403){
				location.href="403error.jsp";		
			}else if(request.status == 429){
				location.href="429error.jsp";
			}else if(request.status == 404){
				location.href = "404error.jsp"
			}else {
				location.href = "500error.jsp"
			}
		}
	});
}


// 나머지 모든 정보 get
function ajax(info_url) {
	$.ajax({
		//async:false, // 순서가 한번씩 바뀌어서나오는문제 해결필요
		type : "GET",
		url : info_url,
		cache : false,
		dataType : "JSON",
		success : function(data, status) {
			if (status == "success"){
				parseJSON(data);
				cnt = cnt + 1;
			}
		},
		error : function(request,status,error) {
			/*alert("2==> code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);*/
			if(request.status == 403){
				location.href="403error.jsp";		
			}else if(request.status == 429){
				location.href="429error.jsp";
			}else if(request.status == 404){
				location.href = "404error.jsp"
			}else {
				location.href = "500error.jsp"
			}
		}
	});
}


function parseJSON(jsonObj) {

   // 기본정보 셋팅
   // summoner info
   if (id == "")
      id = jsonObj.id;
   if (accountId == "")
      accountId = jsonObj.accountId;
   if (puuid == "")
      puuid = jsonObj.puuid;
   if (profileIconId == "")
      profileIconId = jsonObj.profileIconId;
   if (summonerLevel == "")
      summonerLevel = jsonObj.summonerLevel;
   if (IconPath == null || IconPath == "") {
      IconPath = "https://raw.communitydragon.org/latest/plugins/rcp-be-lol-game-data/global/default/v1/profile-icons/" + profileIconId + ".jpg";
      $("#summoner_img").append("<img src='" + IconPath + "'>"); // 이미지태그에 이미지추가
   }
   
   
   // 정보를 가져올 URL 요소 셋팅
   if (leagueUrl == ""){
      leagueUrl = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + id + "?api_key=" + api_key;
   }
   
   
   // 리그정보까지 확인되었을때 구현
   if (cnt == 1) {
      // league info
	/////// JSON Object 순서 뒤바뀌는 예외 처리 !!
	   if(jsonObj.length > 0){
		   if(jsonObj[0].queueType == "RANKED_SOLO_5x5"){ 
				  if(jsonObj[0] != null && jsonObj[0] != ""){
				         if (soloLeagueId == "")   soloLeagueId = jsonObj[0].leagueId;
				         if (soloQueueType == "") soloQueueType = jsonObj[0].queueType;
				         if (soloTier == "")   soloTier = jsonObj[0].tier;
				         if (soloRank == "")   soloRank = jsonObj[0].rank;
				         if (soloSummonerId == "")   soloSummonerId = jsonObj[0].summonerId;
				         if (soloSummonerName == "")   soloSummonerName = jsonObj[0].summonerName;
				         if (soloLeaguePoints == "")   soloLeaguePoints = jsonObj[0].leaguePoints;
				         if (soloWins == "")   soloWins = jsonObj[0].wins;
				         if (soloLosses == "") soloLosses = jsonObj[0].losses;
			      }
			      if(jsonObj[1] != null && jsonObj[1] != ""){
				         if (flexLeagueId == "")   flexLeagueId = jsonObj[1].leagueId;
				         if (flexQueueType == "") flexQueueType = jsonObj[1].queueType;
				         if (flexTier == "") flexTier = jsonObj[1].tier;
				         if (flexRank == "")   flexRank = jsonObj[1].rank;
				         if (flexSummonerId == "")   flexSummonerId = jsonObj[1].summonerId;
				         if (flexSummonerName == "")   flexSummonerName = jsonObj[1].summonerName;
				         if (flexLeaguePoints == "")   flexLeaguePoints = jsonObj[1].leaguePoints;
				         if (flexWins == "")   flexWins = jsonObj[1].wins;
				         if (flexLosses == "") flexLosses = jsonObj[1].losses;
			      }
			  }else {
				  if(jsonObj[1] != null && jsonObj[1] != ""){
				         if (soloLeagueId == "")   soloLeagueId = jsonObj[1].leagueId;
				         if (soloQueueType == "") soloQueueType = jsonObj[1].queueType;
				         if (soloTier == "")   soloTier = jsonObj[1].tier;
				         if (soloRank == "")   soloRank = jsonObj[1].rank;
				         if (soloSummonerId == "")   soloSummonerId = jsonObj[1].summonerId;
				         if (soloSummonerName == "")   soloSummonerName = jsonObj[1].summonerName;
				         if (soloLeaguePoints == "")   soloLeaguePoints = jsonObj[1].leaguePoints;
				         if (soloWins == "")   soloWins = jsonObj[1].wins;
				         if (soloLosses == "") soloLosses = jsonObj[1].losses;
				      }
			      if(jsonObj[0] != null && jsonObj[0] != ""){
				         if (flexLeagueId == "")   flexLeagueId = jsonObj[0].leagueId;
				         if (flexQueueType == "") flexQueueType = jsonObj[0].queueType;
				         if (flexTier == "") flexTier = jsonObj[0].tier;
				         if (flexRank == "")   flexRank = jsonObj[0].rank;
				         if (flexSummonerId == "")   flexSummonerId = jsonObj[0].summonerId;
				         if (flexSummonerName == "")   flexSummonerName = jsonObj[0].summonerName;
				         if (flexLeaguePoints == "")   flexLeaguePoints = jsonObj[0].leaguePoints;
				         if (flexWins == "")   flexWins = jsonObj[0].wins;
				         if (flexLosses == "") flexLosses = jsonObj[0].losses;
				      }
				  
			  }
	   } else {
		   location.href="seasonError.jsp";	
	   }  
	   
	  
      
      
      
      
      // 전적검색 페이지 최상단 기본 정보 추가
      $("#summoner_info").append(
            "<br><h2><b>"+soloSummonerName+"</b></h2><br>"
            +"<h7>레벨: "+summonerLevel+"</h7>"
            +"<h7> 랭크: " +soloWins+"승 "+soloLosses+"패" + "</h7>"
            );
      
      // 해당 소환사 티어에맞는 티어엠블럼 이미지 추가
      soloChk=0;
      flexChk=0;
      var tierArr = ["IRON", "BRONZE", "SILVER", "GOLD", "PLATINUM", "DIAMOND", "MASTER", "GRANDMASTER", "CHALLENGER"];
      var tierPath = "img/rank_emblems/";
      for(var i=0; i< tierArr.length; i++){
         if(tierArr[i] == soloTier){ $("#leagueSolo").append("<img src='" + tierPath + tierArr[i] +".png'>"); soloChk = 1; }
         if(tierArr[i] == flexTier){ $("#leagueFlex").append("<img src='" + tierPath + tierArr[i] +".png'>"); flexChk = 1; }
      }
      if(soloChk == 0) { $("#leagueSolo").append("<img src='" + tierPath + "UNRANKED" +".png'>"); } 
      if(flexChk == 0) { $("#leagueFlex").append("<img src='" + tierPath + "UNRANKED" +".png'>"); } 
      
      
      // 해당 소환사 솔로,자유 랭크 정보추가
      if(soloChk != 0){
         $("#leagueSolo").append(
               "<div id='soloInfo'><br>" 
               + "리그: " + soloQueueType + "<br><br>"
               + "등급: " + soloTier + " " + soloRank + "<br>"
               + "리그포인트: "+ soloLeaguePoints +"<br><br>"
               + "전적: " +soloWins+"승 "+soloLosses+"패" + "<br>"
               + "</div>");
      }else{ //솔랭 돌린적없을때
         $("#leagueSolo").append(
               "<div id='soloInfo'><br>" 
               + "리그: RANKED_SOLO_5X5" + "<br><br>"
               + "등급: 배치" + "<br><br>"
               + "전적: " +"0전 0승 0패" + "<br>"
               + "</div>");
      }
      
      if(flexChk != 0){
         $("#leagueFlex").append(
               "<div id='flexInfo'><br>" 
               + "리그: " + flexQueueType + "<br><br>"
               + "등급: " + flexTier + " " + flexRank + "<br>"
               + "리그포인트: "+ flexLeaguePoints +"<br><br>"
               + "전적: " +flexWins+"승 "+flexLosses+"패" + "<br>"
               + "</div>")
      }else{ //자유랭 돌린적없을때
         $("#leagueFlex").append(
               "<div id='flexInfo'><br>" 
               + "리그: RANKED_FLEX_SR" + "<br><br>"
               + "등급: 배치" + "<br><br>"
               + "전적: " +"0전 0승 0패" + "<br>"
               + "</div>");
      }
      
      
      // 정보를 가져올 URL 요소 셋팅
      if (champion_masteryUrl == ""){
         champion_masteryUrl = "https://kr.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/" + soloSummonerId + "?api_key=" + api_key;
      }
      // 다음 정보 가지러 재귀호출
      ajax(champion_masteryUrl);
   }
   
   
   // 챔피언 마스터리(숙련도 탑 10개만)
   if(cnt == 2){
      var masteryPath = "img/champImg_mini/";
      for(var i=0; i< 10; i++){
         if (championId[i] == "") championId[i] = jsonObj[i].championId;
         if (championLevel[i] == "") championLevel[i] = jsonObj[i].championLevel;
         if (championPoints[i] == "") championPoints[i] = jsonObj[i].championPoints;                  
         
         if(championId[i] != "undefined") {
            $("#mastery_img").append("<div class='mastery_imgs" + "'><img src='" + masteryPath + jsonObj[i].championId +".png'></div>");
            $("#mastery_info").append("<div class='mastery_infos'" + "'><b>" 
                  + champMap[(jsonObj[i].championId)] + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b> <initLevel>숙련도 레벨: " 
                  + jsonObj[i].championLevel + "&nbsp&nbsp&nbsp&nbsp&nbsp</initLevel> <initPoint>" 
                  + jsonObj[i].championPoints + "점</initPoint></div>" ); 
         }
      }
      
      // 정보를 가져올 URL 요소 셋팅
      if (matchListUrl == ""){
         matchListUrl = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/" + accountId + "?endIndex=11&beginIndex=0&api_key=" + api_key;
      }
      // 다음 정보 가지러 재귀호출
      ajax(matchListUrl);
   }
   
   
   // 매치리스트(20판) --> gameId 가져와야됨
   if(cnt == 3){
      for(var i=0; i < 11; i++){
         mlist_gameId[i] = jsonObj.matches[i].gameId       // mlist_gameId[0] : 0번 인덱스에 있는 게임한판 전적
         mlist_champion[i] = jsonObj.matches[i].champion  // 검색한 소환사가 플레이한 챔피언번호 10판
         mlist_queue[i] = jsonObj.matches[i].queue // 게임종류(칼바람, 일반, 솔로랭크, 자유랭크, URF 등) 구분
         mlist_timestamp[i] = jsonObj.matches[i].timestamp
      }
      
      
      // 정보를 가져올 URL 요소 셋팅
      matchesCnt = 0;
      for(var i=0; i < 11; i++){
         if (matchesUrl[i] == null){
            matchesUrl[i] = "https://kr.api.riotgames.com/lol/match/v4/matches/" + mlist_gameId[i] + "?api_key=" + api_key;
         }
      }
      // 다음 정보 가지러 재귀호출 10번반복
      ajax(matchesUrl[0]);            
   }

	
	if(cnt == 4){ gameDetail(0, jsonObj); ajax(matchesUrl[1]);}
	if(cnt == 5){ gameDetail(1, jsonObj); ajax(matchesUrl[2]);}
	if(cnt == 6){ gameDetail(2, jsonObj); ajax(matchesUrl[3]);}
	if(cnt == 7){ gameDetail(3, jsonObj); ajax(matchesUrl[4]);}
	if(cnt == 8){ gameDetail(4, jsonObj); ajax(matchesUrl[5]);}
	
	/*  // too many request --> 라이엇에서 최대 request 수 제한 둠
	if(cnt == 9){ gameDetail(5, jsonObj); ajax(matchesUrl[6]);}
	if(cnt == 10){ gameDetail(6, jsonObj); ajax(matchesUrl[7]);}
	if(cnt == 11){ gameDetail(7, jsonObj); ajax(matchesUrl[8]);}
	if(cnt == 12){ gameDetail(8, jsonObj); ajax(matchesUrl[9]);}
	if(cnt == 13){ gameDetail(9, jsonObj); ajax(matchesUrl[10]);}
	*/
	
	
	// 한판한판 정보 10번 받아올 메소드
	function gameDetail(gameCnt, jsonObjCopy){ //order : 10번동안 순번
		matches_queueId[gameCnt] = jsonObjCopy.queueId; // 10판을 조회하기때문에 0~10
		tempNumChamp = "";
		
		
		for(var user=0; user<10; user++){ // i : 10명의 플레이어
			matches_participants[gameCnt][user][0] = jsonObjCopy.participants[user].championId; // matches_participants[gameCnt][i][0] : championId		
			matches_participants[gameCnt][user][1] = jsonObjCopy.participants[user].teamId; // [1]teamId		
		}
		
		for(var user=0; user<10; user++){ // i: 10명~~
			if(mlist_champion[gameCnt] == matches_participants[gameCnt][user][0]){ // 검색한소환사의 챔피언 일치하는지 확인
				var me = user; // 내가검색한 사람과 일치하는 유저 찾아서 저장(championId로 식별)
				var myTeamId = matches_participants[gameCnt][me][1];
				tempNumChamp = matches_participants[gameCnt][me][0]; // 내챔피언아이디(이미지위한 임시로)
				meChk = me;
				
				matches_win[me] = jsonObjCopy.participants[me].stats.win; // 각 10판을 이겻는지 졋는지 저장(검색한 내기준)
				matches_buyItem[gameCnt][0] = jsonObjCopy.participants[me].stats.item0; // 한판당 내가 구매한 아이템들
				matches_buyItem[gameCnt][1] = jsonObjCopy.participants[me].stats.item1;
				matches_buyItem[gameCnt][2] = jsonObjCopy.participants[me].stats.item2;
				matches_buyItem[gameCnt][3] = jsonObjCopy.participants[me].stats.item3;
				matches_buyItem[gameCnt][4] = jsonObjCopy.participants[me].stats.item4;
				matches_buyItem[gameCnt][5] = jsonObjCopy.participants[me].stats.item5;
				matches_buyItem[gameCnt][6] = jsonObjCopy.participants[me].stats.item6; //  와드자리 
				
				matches_kills[gameCnt] = jsonObjCopy.participants[me].stats.kills; // 각 10판 한판씩 킬 데스 어시
				matches_deaths[gameCnt] = jsonObjCopy.participants[me].stats.deaths; 
				matches_assists[gameCnt] = jsonObjCopy.participants[me].stats.assists; 
				
				if(matches_deaths[gameCnt] != 0) { 
					matches_avg = ( matches_kills[gameCnt] + matches_assists[gameCnt] ) / matches_deaths[gameCnt]; 
				}
				else { 
					matches_avg = ( matches_kills[gameCnt] + matches_assists[gameCnt] ) / 1; 
				}// arithmetic 
				
				
				matches_spell1Id[gameCnt] = jsonObjCopy.participants[me].spell1Id; // 각 10판 내가고른 스펠
				matches_spell2Id[gameCnt] = jsonObjCopy.participants[me].spell2Id;
				
				// 스펠이미지 매핑 + 경로설정
				spellImgPath1 = "img/summoner_spell/" + matches_spell1Id[gameCnt];
				spellImgPath2 = "img/summoner_spell/" + matches_spell2Id[gameCnt];
				
				// 아이템 이미지 매핑 url
				if(matches_buyItem[gameCnt][0] != 0){ itemImgPath0 = "https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/" + matches_buyItem[gameCnt][0]; }
				else{ itemImgPath0 = "img/unlinked_item/" +  matches_buyItem[gameCnt][0];}
				if(matches_buyItem[gameCnt][1] != 0){ itemImgPath1 = "https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/" + matches_buyItem[gameCnt][1]; }
				else{ itemImgPath1 = "img/unlinked_item/" +  matches_buyItem[gameCnt][1];}
				if(matches_buyItem[gameCnt][2] != 0){ itemImgPath2 = "https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/" + matches_buyItem[gameCnt][2]; }
				else{ itemImgPath2 = "img/unlinked_item/" +  matches_buyItem[gameCnt][2];}
				if(matches_buyItem[gameCnt][3] != 0){ itemImgPath3 = "https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/" + matches_buyItem[gameCnt][3]; }
				else{ itemImgPath3 = "img/unlinked_item/" +  matches_buyItem[gameCnt][3];}
				if(matches_buyItem[gameCnt][4] != 0){ itemImgPath4 = "https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/" + matches_buyItem[gameCnt][4]; }
				else{ itemImgPath4 = "img/unlinked_item/" +  matches_buyItem[gameCnt][4];}
				if(matches_buyItem[gameCnt][5] != 0){ itemImgPath5 = "https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/" + matches_buyItem[gameCnt][5]; }
				else{ itemImgPath5 = "img/unlinked_item/" +  matches_buyItem[gameCnt][5];}
				if(matches_buyItem[gameCnt][6] != 0){ itemImgPath6 = "https://ddragon.leagueoflegends.com/cdn/10.6.1/img/item/" + matches_buyItem[gameCnt][6]; }
				else{ itemImgPath6 = "img/unlinked_item/" +  matches_buyItem[gameCnt][6];}
				
				
				// 게임 결과(승/패) 이름 매핑
				if(matches_win[me] == true){ result = "승"; }
				else{ result = "패"; }
				
			}// end if	
		
		}// end for
		

		//우리팀적팀 챔피언아이디
		allUser0 = matches_participants[gameCnt][0][0];  
		allUser1 = matches_participants[gameCnt][1][0]; 
		allUser2 = matches_participants[gameCnt][2][0];  
		allUser3 = matches_participants[gameCnt][3][0];
		allUser4 = matches_participants[gameCnt][4][0];  
		allUser5 = matches_participants[gameCnt][5][0];
		allUser6 = matches_participants[gameCnt][6][0];  
		allUser7 = matches_participants[gameCnt][7][0];
		allUser8 = matches_participants[gameCnt][8][0];  
		allUser9 = matches_participants[gameCnt][9][0];
		
		getQueueTypeInfo(matches_queueId[gameCnt]); // 게임종류 이름 매핑
		
		var pickChampPath = "img/champImg_mini/"; // 챔피언 사진
		// 1. 해야되는건 우선 queueId -> 칼바람, 솔랭 , 자유랭 등등 매핑시켜서 바꿔치기
		$("#recentPlay").append(
				"<div class='recentPlayOut' id='recentPlayOut"+ gameCnt +"'>"
					+ "<div class='recentPlay_info1'><h6>" + result + "</h6></div>"							
					+ "<div class='recentPlay_info2'>" + "<img src='" + pickChampPath + tempNumChamp + ".png' >" + "</div>"
					+ "<div class='recentPlay_info3'><h5>" + mapLabel + "</h5></div>"
					+ "<div class='recentPlay_info4'>"
						+ "<div style='color:blue'>평점 " + matches_avg.toFixed(2) + "</div>" 
						+ "<div>" +matches_kills[gameCnt] + " / "+ matches_deaths[gameCnt] + " / " + matches_assists[gameCnt] +"</div>"
					+ "</div>"
					+ "<div class='recentPlay_info5'>"
						+"<img src='" + spellImgPath1 + ".png'>"
						+"<img src='" + spellImgPath2 + ".png'>" 
					+ "</div>"
					+ "<div class='recentPlay_info6'>"
						+"<div class='recentPlay_info6_inner'>"
							+"<img src='" + pickChampPath + allUser0 + ".png'>"
							+"<img src='" + pickChampPath + allUser1 + ".png'>"
							+"<img src='" + pickChampPath + allUser2 + ".png'>"
							+"<img src='" + pickChampPath + allUser3 + ".png'>"
							+"<img src='" + pickChampPath + allUser4 + ".png'>"
						+"</div>"
						+"<div class='recentPlay_info6_inner'>"
							+"<img src='" + pickChampPath + allUser5 + ".png'>"
							+"<img src='" + pickChampPath + allUser6 + ".png'>"
							+"<img src='" + pickChampPath + allUser7 + ".png'>"
							+"<img src='" + pickChampPath + allUser8 + ".png'>"
							+"<img src='" + pickChampPath + allUser9 + ".png'>"
					+"</div>"
					+ "</div>"
					+ "<div class='recentPlay_info7'>"
						+"<img src='" + itemImgPath0 + ".png'>"
						+"<img src='" + itemImgPath1 + ".png'>"
						+"<img src='" + itemImgPath2 + ".png'>"
						+"<img src='" + itemImgPath3 + ".png'>" 
						+"<img src='" + itemImgPath4 + ".png'>"
						+"<img src='" + itemImgPath5 + ".png'>"
						+"<img src='" + itemImgPath6 + ".png'>" 
					+ "</div>"
				+ "</div>"
			);
	
		if(result == "승"){
			$("#recentPlayOut"+gameCnt+"").css("background-color","rgba(80, 188, 223, 0.2)");
		}
		else{
			$("#recentPlayOut"+gameCnt+"").css("background-color","rgba(225, 0, 0, 0.2)");
		}
	}// end gameDetail()
	
	
} // end parseJSON()


// 큐 종류(맵) 이름 매핑
function getQueueTypeInfo(type){
   switch (type) {
      case 450:
         mapLabel = "무작위 총력전";
         mapType = "howling-abyss";
         mapName = "일반(칼바람 나락)";
         break;
      case 420:
         mapLabel = "솔로 랭크";
         mapType = "summoners-rift";
         mapName = "솔로 랭크";
         break;
      case 430:
         mapLabel = "일반";
         mapType = "summoners-rift";
         mapName = "일반(소환사의 협곡)";
         break;
      case 440:
         mapLabel = "자유 랭크";
         mapType = "summoners-rift";
         mapName = "자유 랭크";
         break;
      case 830:
         mapLabel = "입문 봇전";
         mapType = "summoners-rift";
         mapName = "입문 봇전(소환사의 협곡)";
         break;
      case 840:
         mapLabel = "초보 봇전";
         mapType = "summoners-rift";
         mapName = "초보 봇전(소환사의 협곡)";
         break;
      case 850:
         mapLabel = "중급 봇전";
         mapType = "summoners-rift";
         mapName = "중급 봇전(소환사의 협곡)";
         break;
      case 900:
         mapLabel = "U.R.F";
         mapType = "summoners-rift";
         mapName = "우르프";
         break;
      case 920:
         mapLabel = "포로왕";
         mapType = "howling-abyss";
         mapName = "포로왕(칼바람 나락)";
         break;
      default:
         mapLabel = "qType " + type;
         mapName = "QueueType " + type;
         break;
      }
   
   return;
}

ajaxDefault(); // 첫 ajax(소환사 기본정도 고유id값들, 레벨 가져오고 시작해야됨!!)
