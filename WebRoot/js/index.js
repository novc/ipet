window.onload = function(){
	$(".top").load("header.html",function(){
		topFun();
	});
	
//    $.getJSON("../json/dog-list.json", function(res) {
//        // console.log(res);
//        var hotlink = res.hotlink;
//        var navdata = res.nav;
//        var fengqiang = res.fengqiang;
//        var brand = res.brand;
//        var food = res.food;
//        var create = new Create(res);
//        create.createHotlink().navEvent().createCarrousel().createFengQiang().createBrand().createFoodList();
//    });
	$.ajax({
		url:"http://localhost:8080/ipet/getNavTypeName",
		type:"POST",
		success:function(msg){
			var res = JSON.parse(msg);
			for (var i in res){
				console.log(res.subTypeName);
			}
			function createMidList(i, y) {
                if (i == res.nav[i].id && res.nav[i]) {
                    // 渲染产品列表
                    if (i <= 13 && i >= 0) {
                        if (res.nav[i].content == "no") {
                            return;
                        } else if (res.nav[i]) {
                            $(".catels .temai").css({ "display": "none" });
                            $(".catels .cate_1").css({ 'display': 'block' });
                            var nTitle = "<div class='ctitle'><img class='pic_title' src='img/" + res.nav[i].main_pic + "' /><a href='#'>" + res.nav[i].name + "</a><i></i><a href='#'><img src='img/" + res.nav[i].ad_pic + "' /></a></div>";
                            $(".catels .cate_1").append(nTitle);
                            var nListCon = "<div class='mid_list'><ul></ul></div>";
                            $(".catels .cate_1").append(nListCon);
                            var content = res.nav[i].content;
                            for (var j in content) {
                                var nMidList = "<li><a class='mid_head' href='#'>" + content[j].title + "</a><img src='img/" + content[j].mid_pic + "'></li>"
                                $(".catels .mid_list ul:last").append(nMidList);
                                for (var k in content[j].midList) {
                                    var nLink = "<a href='#'>" + content[j].midList[k].name + "</a>"
                                    $(".catels .cate_1 .mid_list li:last").append(nLink);
                                }
                            }
                        }

                    }
                    // 错误处理
                    else {
                        console.log("error");
                        return;
                    }
                }
            }; //导航栏列表操作函数END

            var pIdx;
            $(".catelist .dogType li").mouseenter(function() {
                var that = this;
                pIdx = parseInt($(this).attr("idx"));

                $(".catels .cate_1").empty();
                $(".catels .temai div").empty();

                createMidList(pIdx);

                if (pIdx <= 13 && pIdx >= 0) {
                    createMidList(pIdx + 1);
                }

                $(".catelist .dogType li").css({ "border-right": "1px solid #459d36" });
                $(this).css({ "border-top": "1px solid #459d36", "border-bottom": "1px solid #459d36", "border-right": "0px", "margin-top": "-1px", "background": "none", "background-color": "#fff" });
                $(this).children("h3").css({ "border": "none", "background-position": "190px -1207px" });
                $(".catels").css({ "display": "inline-block" });

                wen_direction.run($(this)[0], enterObject, leaveObject);
            });
            $(".catels").mouseleave(function() {
                $(".catelist .dogType li").css({ "border": "0px", "margin-top": "0px", "background-color": "#fcfcfc" });
                $(".catelist .dogType li h3").css({ "border-bottom": "1px dotted #ddd", "background-position": "168px -1207px" });
                $(this).css({ "display": "none" });
            });
		}
	})
	var create = new Create();
	create.createCarrousel();
    function Create(data) {
        var res = data;
        // 热门搜索
        this.createHotlink = function() {
            $(".hotlink").append("<a class='cred' href='#'>" + res.hotlink.hot + "</a>");
            var aLink = res.hotlink.link;
            var aLinkLength = aLink.length;
            for (var i = 0; i < aLinkLength; i++) {
                if (i == 0) {
                    $(".hotlink").append("<a href='#'>" + aLink[0] + "</a>");

                } else if (i == aLinkLength - 1) {
                    $(".hotlink").append("<a href='#'>" + aLink[aLinkLength - 1] + "</a>");
                } else {
                    $(".hotlink").append("<a href='#'>" + aLink[i] + "</a>");
                }
            }
            $(".hotlink a:first").css({ "padding-left": "0px" });
            $(".hotlink a:last").css({ "border": "0px" });
            return this;
        };

        this.navEvent = function() {
            /**
             * 产生导航栏列表
             * @param  {[type]} res 要操作的数据
             * @return {[type]}     无
             */
            
            $(".temai .page_left").click(function() {
                var currentNum = parseInt($(".temai p .current_num").html());
                var sumNum = parseInt($(".temai p .sum_num").html());

                if (currentNum < 2) {
                    console.log("左边没有了");
                    return;
                } else {
                    $(".catels .temai .current_num").html(currentNum - 1);
                    createMidList(14, (currentNum - 2) * 4);
                }
            });

            $(".temai .page_right").click(function() {

                var currentNum = parseInt($(".temai p .current_num").html());
                var sumNum = parseInt($(".temai p .sum_num").html());

                if (currentNum >= sumNum) {
                    console.log("右边没有了");
                    return;
                } else {
                    $(".catels .temai .current_num").html(currentNum + 1);
                    createMidList(14, currentNum * 4);
                }
            }); //导航栏时间END
            return this;
        }
        this.createCarrousel = function() {
            /**---------------轮播图BEGIN--------------*/
            var mySwiper = new Swiper('.swiper-container', {
                autoplay: 5000,
                loop: true,
                effect: "fade",
                paginationClickable: true,
                pagination: '.swiper-pagination'
            }); //轮播图END
            return this;
        }
        this.createFengQiang = function() {
            createFengQiang("0");
            $(".time-protit li").mouseenter(function() {
                var that = this;
                $(".time-protit li div").removeClass('active-begin');
                $(this).children("div").addClass("active-begin");
                var idx = $(that).attr("idx");
                createFengQiang(idx);
            });

            function createFengQiang(idx) {
                $(".time-proconli ul").empty();
                var l = res.fengqiang[idx].length * 210;
                $(".time-proconli ul").css({ "width": l + "px" });
                for (var i in res.fengqiang[idx]) {
                    $(".time-proconli ul").append("<li><div><a href=''><img src='img/" + res.fengqiang[idx][i].proImg + "' alt=''></a></div><span class='time-proname'>" + res.fengqiang[idx][i].proName + "</span><p><span class='now-price'>" + res.fengqiang[idx][i].nowPrice + "</span><span class='old-price'>" + res.fengqiang[idx][i].oldPrice + "</span><span class='progres.fengqiangs-bar'><i></i></span><a>立即抢购</a></p></li>")
                    var len = res.fengqiang[idx][i].stock / res.fengqiang[idx][i].number * 170;
                    $(".time-proconli ul li i").last().css({ "width": len });
                }
            }

            $(".time-proleft").click(function() {
                if ($(".time-proconli ul")[0].offsetLeft >= 0) {
                    return;
                } else {
                    $(".time-proconli ul").animate({ "left": ($(".time-proconli ul")[0].offsetLeft + 210) + "px" }, 200);
                }
            });
            $(".time-proright").click(function() {
                var MaxLength = $(".time-proconli ul li").size() * 210;
                if ($(".time-proconli ul")[0].offsetLeft + MaxLength <= 840) {
                    return;
                } else {
                    $(".time-proconli ul").animate({ "left": ($(".time-proconli ul")[0].offsetLeft - 210) + "px" }, 200);
                }
            });
            return this;
        }
        this.createBrand = function() {
            /**---------------品牌轮播图BEGIN--------------*/
            var mySwiper = new Swiper('.pinpaiWrap', {
                autoplay: 600,
                loop: true,
                paginationClickable: true,
                pagination: '.swiper-pagination'
            }); //品牌轮播图END
            var len = res.brand.length;
            for (var i = 0; i < len; i++) {
                if (res.brand[i].stock == 0) {
                    $(".pinpai .brands-list").append("<div class='fl'><a href=''><img src='img/" + res.brand[i].pic + "' alt=''></a></div>");
                } else {
                    $(".pinpai .brands-list").append("<div class='fl'><a href=''><img src='img/" + res.brand[i].pic + "' alt=''></a><p><span>" + res.brand[i].stock + "</span><i>件商品</i></p></div>");
                }
            }
            return this;
        }
        this.createFoodList = function() {

            /**
             * [createFoodCon description]
             * @param  {[int]} a [第几个foodlist，即第几个大类，第一次使用时传当前循环量i,生成全部几个大类]
             * @param  {[string]} b [哪个小类，默认0，即“热门”]
             * @return {[type]}   [description]
             */
            function createFoodCon(idx, libname) {
                var foodlist = fooddata[idx].foodlist[libname];
                if (foodlist.type == "0") {

                    $(".libconbox:eq(" + idx + ")").append("<div class='con-0'></div>");
                    for (var k in foodlist.list) {

                        $(".libconbox:eq(" + idx + ") .con-0").append("<div class='imgbox fl'><a href=''><img src='img/" + foodlist.list[k].pic + "' alt=''><div>" + foodlist.list[k].title + "</div><span>" + foodlist.list[k].mask + "</span></a></div>");
                    }
                }
                if (foodlist.type == "1") {
                    console.log(foodlist.list);
                    $(".food-pro:eq(" + idx + ") .libconbox").append("<div class='con-1'><div class='pro-list'><ul></ul></div></div>");
                    for (var k in foodlist.list) {
                        $(".libconbox:eq(" + idx + ") .con-1 ul").append("<li><div class='imgbox'><a href=''><img class='hoverup' src='img/" + foodlist.list[k].pic + "' /></a></div><p><a href=''>" + foodlist.list[k].title + "</a></p><span class='price'>" + foodlist.list[k].price + "</span></li>");
                    }
                }
            }
            console.log(data.food);
            var fooddata = data.food;
            for (var i in fooddata) {
                var idx = i;
                $(".renew").append("<div class='epetfoodblock w-max w mt30' cate = " + i + "></div>");
                $(".epetfoodblock:eq(" + idx + ")").append("<div class='epetfood-tit ft20'><i><img src='img/" + fooddata[i].icon + "' /></i><span>" + fooddata[i].title + "</span></div><div class='clearfix'><div class='adimg fl'></div><div class='food-pro fr'></div></div><div class='clearfix brand-list'><ul></ul></div>");
                $(".epetfoodblock:eq(" + idx + ") .adimg").append("<a href='#'><img src='img/" + fooddata[i].adimg + "' alt=''></a><div class='stylebg clearfix'><div class='hotkind clearfix'><span class='fl'>———————</span><i class='fl'></i><h6 class='fl'>最热HOT</h6><span class='fl'>———————</span></div><ul></ul></div>");
                var hotlen = fooddata[i].hot.length;
                // console.log(hotlen)
                for (var a = 0; a < hotlen; a++) {
                    $(".epetfoodblock:eq(" + idx + ") .adimg ul").append("<li><a href=''>" + fooddata[i].hot[a] + "</a></li>")
                }
                $(".food-pro:eq(" + idx + ")").append("<div class='lib-menu abs'><ul></ul></div><div class='libconbox'></div></div>")
                var libMenuLen = fooddata[i].foodlist.length;
                for (var j = 0; j < libMenuLen; j++) {
                    if(j==0){
                    $(".food-pro:eq(" + idx + ") .lib-menu ul").append("<li class='active' type='" + fooddata[i].foodlist[j].type + "' cate = " + i + "><p></p><span>" + fooddata[i].foodlist[j].name + "</span></li>")

                    }else{
                    $(".food-pro:eq(" + idx + ") .lib-menu ul").append("<li type='" + fooddata[i].foodlist[j].type + "' cate = " + i + "><p></p><span>" + fooddata[i].foodlist[j].name + "</span></li>")

                    }
                }
                createFoodCon(i, 0);

                for (var a in fooddata[idx].brandList) {
                    $(".brand-list:last ul").append("<li><a href=''><img src='img/" + fooddata[idx].brandList[a] + "' alt=''></a></li>");

                }
            }

            $(".lib-menu li").click(function() {
                $(".lib-menu li").removeClass("active");
                $(this).addClass("active");
                var targetcate = parseInt($(this).attr("cate"));

                $(".libconbox:eq(" + targetcate + ")").empty();
                createFoodCon(targetcate, $(this).index());
            });

            return this;
        }
    }
}