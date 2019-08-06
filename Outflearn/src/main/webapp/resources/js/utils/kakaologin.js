
				  //<![CDATA[
				    // 사용할 앱의 JavaScript 키를 설정해 주세요.
              	    Kakao.init('85e61dfa4e850de4478ab8c6df1a737a');
				    // 카카오 로그인 버튼을 생성합니다.
				    Kakao.Auth.createLoginButton({
				      container: '#kakao-login-btn',
				      success: function(authObj) {
	 				        alert(JSON.stringify(authObj));	

				    	  Kakao.API.request({
				    		 url: '/v1/user/me',
				    		 success: function(res){
				    			 
				    			 alert(res);				    			 
				    			 res.id += "@k";	
				    			alert(res.id);
				    			
				    			$.ajax({
				    				url: "idChk.do",
				    				data: "id="+res.id,
				    				
				    				success: function(data){
				    					alert(data.idChk);
				    					if(data.idChk==true){ //아이디가 없다면 회원가입 
				    						alert("회원가입");
				    						
				    						var param = 
				    						{"user_id":res.id, "user_pw":res.id, "user_email":res.kaccount_email, "user_nickname":res.properties.nickname }
				    						
				    						$.ajax({
				    							url: "kakaoUserinsert",
				    							method: "POST",
				    							data: param	,
				    							success : function(){ //회원가입 성공
				    								alert("회원가입 완료");
				    							}
				    						});
				    						
				    					}else{ //아이디가 있다면 로그인
				    						
				    					}
				    				}
				    				
				    				
				    			});
				    		 }
				    		  
				    		  
				    	  });




				      },
				      fail: function(err) {
				         alert(JSON.stringify(err));
				      }
				    });
				  //]]>
