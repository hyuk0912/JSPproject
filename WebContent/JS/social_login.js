

    /* 네이버 */
    var naverLogin = new naver.LoginWithNaverId({
        clientId: "u9lQr7jk9E6xhQ34PYyn",
        callbackUrl: "http://127.0.0.1:8080/OP_IT/callback.jsp",
        isPopup: true,
        /* 팝업을 통한 연동처리 여부 */
        loginButton: {
            color: "green",
            type: 3,
            height: 50
        } /* 로그인 버튼의 타입을 지정 */
    });

    /* 설정정보를 초기화하고 연동을 준비 */
    naverLogin.init();




