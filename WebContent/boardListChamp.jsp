<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>OP.IT</title>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<!-- 파비콘 설정-->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="CSS/boardListChamp.css">

		<% 
			int board_champion =  Integer.parseInt(request.getParameter("board_champion")); 
		%>
		
</head>
<body>
<jsp:include page="thema.jsp"/>
<div class="container" id="champInfoDiv">

	<div id="champImg"><img class="championListImg" src="img/championImg/RiotX_ChampionList${board_champion }.jpg" alt=""></div>
	<div id="champInfo"></div>


</div>

</body>

<script>


		
		// 챔피언 번호 매핑 셋팅
		champMap = { 
			1:"Annie",
			2:"Olaf",
		    3:"Galio",
		    4:"TwistedFate",
		    5:"XinZhao",
		    6:"Urgot",
		    7:"Leblanc",
		    8:"Vladimir",
		    9:"Fiddlesticks",
		    10:"Kayle",
		    11:"MasterYi",
		    12:"Alistar",
		    13:"Ryze",
		    14:"Sion",
		    15:"Sivir",
		    16:"Soraka",
		    17:"Teemo",
		    18:"Tristana",
		    19:"Warwick",
		    20:"Nunu",
		    21:"MissFortune",
		    22:"Ashe",
		    23:"Tryndamere",
		    24:"Jax",
		    25:"Morgana",
		    26:"Zilean",
		    27:"Singed",
		    28:"Evelynn",
		    29:"Twitch",
		    30:"Karthus",
		    31:"Chogath",
		    32:"Amumu",
		    33:"Rammus",
		    34:"Anivia",
		    35:"Shaco",
		    36:"DrMundo",
		    37:"Sona",
		    38:"Kassadin",
		    39:"Irelia",
		    40:"Janna",
		    41:"Gangplank",
		    42:"Corki",
		    43:"Karma",
		    44:"Taric",
		    45:"Veigar",
		    48:"Trundle",
		    50:"Swain",
		    51:"Caitlyn",
		    53:"Blitzcrank",
		    54:"Malphite",
		    55:"Katarina",
		    56:"Nocturne",
		    57:"Maokai",
		    58:"Renekton",
		    59:"JarvanIV",
		    60:"Elise",
		    61:"Orianna",
		    62:"MonkeyKing",
		    63:"Brand",
		    64:"LeeSin",
		    67:"Vayne",
		    68:"Rumble",
		    69:"Cassiopeia",
		    72:"Skarner",
		    74:"Heimerdinger",
		    75:"Nasus",
		    76:"Nidalee",
		    77:"Udyr",
		    78:"Poppy",
		    79:"Gragas",
		    80:"Pantheon",
		    81:"Ezreal",
		    82:"Mordekaiser",
		    83:"Yorick",
		    84:"Akali",
		    85:"Kennen",
		    86:"Garen",
		    89:"Leona",
		    90:"Malzahar",
		    91:"Talon",
		    92:"Riven",
		    96:"KogMaw",
		    98:"Shen",
		    99:"Lux",
		    101:"Xerath",
		    102:"Shyvana",
		    103:"Ahri",
		    104:"Graves",
		    105:"Fizz",
		    106:"Volibear",
		    107:"Rengar",
		    110:"Varus",
		    111:"Nautilus",
		    112:"Viktor",
		    113:"Sejuani",
		    114:"Fiora",
		    115:"Ziggs",
		    117:"Lulu",
		    119:"Draven",
		    120:"Hecarim",
		    121:"Khazix",
		    122:"Darius",
		    126:"Jayce",
		    127:"Lissandra",
		    131:"Diana",
		    133:"Quinn",
		    134:"Syndra",
		    136:"AurelionSol",
		    141:"Kayn",
		    142:"Zoe",
		    143:"Zyra",
		    145:"Kaisa",
		    150:"Gnar",
		    154:"Zac",
		    157:"Yasuo",
		    161:"Velkoz",
		    163:"Taliyah",
		    164:"Camille",
		    201:"Braum",
		    202:"Jhin",
		    203:"Kindred",
		    222:"Jinx",
		    223:"TahmKench",
		    235:"Senna",
		    236:"Lucian",
		    238:"Zed",
		    240:"Kled",
		    245:"Ekko",
		    246:"Qiyana",
		    254:"Vi",
		    266:"Aatrox",
		    267:"Nami",
		    268:"Azir",
		    350:"Yuumi",
		    412:"Thresh",
		    420:"Illaoi",
		    421:"RekSai",
		    427:"Ivern",
		    429:"Kalista",
		    432:"Bard",
		    497:"Rakan",
		    498:"Xayah",
		    516:"Ornn",
		    517:"Sylas",
		    518:"Neeko",
		    523:"Aphelios",
		    555:"Pyke",
		    875:"Sett"
		}
		
		
		
	function ajaxDefault(){
		$.ajax({
			//async:false,
			type : "GET",
			url : "https://ddragon.leagueoflegends.com/cdn/10.6.1/data/ko_KR/champion.json",
			cache : false,
			dataType : "JSON",
			success : function(data, status) {
				if (status == "success"){
					parseJSON(data);
				}
			},
			error : function(xhr, status, error) {
				alert("에러 발생");
			}
		});
	}

	function parseJSON(jsonObj) {
		var championNum = <%= board_champion%>;
		<%
			HashMap<Integer,String> map = new HashMap<Integer,String>();
				map.put(1,"Annie");
				map.put(2,"Olaf");
			    map.put(3,"Galio");
			    map.put(4,"TwistedFate");
			    map.put(5,"XinZhao");
			    map.put(6,"Urgot");
			    map.put(7,"Leblanc");
			    map.put(8,"Vladimir");
			    map.put(9,"Fiddlesticks");
			    map.put(10,"Kayle");
			    map.put(11,"MasterYi");
			    map.put(12,"Alistar");
			    map.put(13,"Ryze");
			    map.put(14,"Sion");
			    map.put(15,"Sivir");
			    map.put(16,"Soraka");
			    map.put(17,"Teemo");
			    map.put(18,"Tristana");
			    map.put(19,"Warwick");
			    map.put(20,"Nunu");
			    map.put(21,"MissFortune");
			    map.put(22,"Ashe");
			    map.put(23,"Tryndamere");
			    map.put(24,"Jax");
			    map.put(25,"Morgana");
			    map.put(26,"Zilean");
			    map.put(27,"Singed");
			    map.put(28,"Evelynn");
			    map.put(29,"Twitch");
			    map.put(30,"Karthus");
			    map.put(31,"Chogath");
			    map.put(32,"Amumu");
			    map.put(33,"Rammus");
			    map.put(34,"Anivia");
			    map.put(35,"Shaco");
			    map.put(36,"DrMundo");
			    map.put(37,"Sona");
			    map.put(38,"Kassadin");
			    map.put(39,"Irelia");
			    map.put(40,"Janna");
			    map.put(41,"Gangplank");
			    map.put(42,"Corki");
			    map.put(43,"Karma");
			    map.put(44,"Taric");
			    map.put(45,"Veigar");
			    map.put(48,"Trundle");
			    map.put(50,"Swain");
			    map.put(51,"Caitlyn");
			    map.put(53,"Blitzcrank");
			    map.put(54,"Malphite");
			    map.put(55,"Katarina");
			    map.put(56,"Nocturne");
			    map.put(57,"Maokai");
			    map.put(58,"Renekton");
			    map.put(59,"JarvanIV");
			    map.put(60,"Elise");
			    map.put(61,"Orianna");
			    map.put(62,"MonkeyKing");
			    map.put(63,"Brand");
			    map.put(64,"LeeSin");
			    map.put(67,"Vayne");
			    map.put(68,"Rumble");
			    map.put(69,"Cassiopeia");
			    map.put(72,"Skarner");
			    map.put(74,"Heimerdinger");
			    map.put(75,"Nasus");
			    map.put(76,"Nidalee");
			    map.put(77,"Udyr");
			    map.put(78,"Poppy");
			    map.put(79,"Gragas");
			    map.put(80,"Pantheon");
			    map.put(81,"Ezreal");
			    map.put(82,"Mordekaiser");
			    map.put(83,"Yorick");
			    map.put(84,"Akali");
			    map.put(85,"Kennen");
			    map.put(86,"Garen");
			    map.put(89,"Leona");
			    map.put(90,"Malzahar");
			    map.put(91,"Talon");
			    map.put(92,"Riven");
			    map.put(96,"KogMaw");
			    map.put(98,"Shen");
			    map.put(99,"Lux");
			    map.put(101,"Xerath");
			    map.put(102,"Shyvana");
			    map.put(103,"Ahri");
			    map.put(104,"Graves");
			    map.put(105,"Fizz");
			    map.put(106,"Volibear");
			    map.put(107,"Rengar");
			    map.put(110,"Varus");
			    map.put(111,"Nautilus");
			    map.put(112,"Viktor");
			    map.put(113,"Sejuani");
			    map.put(114,"Fiora");
			    map.put(115,"Ziggs");
			    map.put(117,"Lulu");
			    map.put(119,"Draven");
			    map.put(120,"Hecarim");
			    map.put(121,"Khazix");
			    map.put(122,"Darius");
			    map.put(126,"Jayce");
			    map.put(127,"Lissandra");
			    map.put(131,"Diana");
			    map.put(133,"Quinn");
			    map.put(134,"Syndra");
			    map.put(136,"AurelionSol");
			    map.put(141,"Kayn");
			    map.put(142,"Zoe");
			    map.put(143,"Zyra");
			    map.put(145,"Kaisa");
			    map.put(150,"Gnar");
			    map.put(154,"Zac");
			    map.put(157,"Yasuo");
			    map.put(161,"Velkoz");
			    map.put(163,"Taliyah");
			    map.put(164,"Camille");
			    map.put(201,"Braum");
			    map.put(202,"Jhin");
			    map.put(203,"Kindred");
			    map.put(222,"Jinx");
			    map.put(223,"TahmKench");
			    map.put(235,"Senna");
			    map.put(236,"Lucian");
			    map.put(238,"Zed");
			    map.put(240,"Kled");
			    map.put(245,"Ekko");
			    map.put(246,"Qiyana");
			    map.put(254,"Vi");
			    map.put(266,"Aatrox");
			    map.put(267,"Nami");
			    map.put(268,"Azir");
			    map.put(350,"Yuumi");
			    map.put(412,"Thresh");
			    map.put(420,"Illaoi");
			    map.put(421,"RekSai");
			    map.put(427,"Ivern");
			    map.put(429,"Kalista");
			    map.put(432,"Bard");
			    map.put(497,"Rakan");
			    map.put(498,"Xayah");
			    map.put(516,"Ornn");
			    map.put(517,"Sylas");
			    map.put(518,"Neeko");
			    map.put(523,"Aphelios");
			    map.put(555,"Pyke");
			    map.put(875,"Sett");
		%>
		
		var championName = champMap[championNum];	//가렌
		<% String championInfo = map.get(board_champion); %>
		
		document.getElementById("champInfo").innerHTML = jsonObj.data.<%= championInfo %>.blurb;
	}
	
	
	
	ajaxDefault();
</script>

</html>