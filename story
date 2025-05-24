<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아기 돼지 삼 형제: 마음을 읽는 교실</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #FFFBEB;
        }
        .section-title {
            color: #D97706;
        }
        .pig-card {
            background-color: #FEF3C7;
            border: 2px solid #FBBF24;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .pig-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 12px -2px rgba(0, 0, 0, 0.1);
        }
        .thought-bubble {
            display: none;
            background-color: #E0F2FE;
            border: 2px solid #7DD3FC;
            padding: 1rem;
            border-radius: 0.75rem;
            margin-top: 0.75rem;
            position: relative;
            animation: fadeIn 0.3s ease-in;
        }
        .thought-bubble.active {
            display: block;
        }
        .thought-bubble::before {
            content: '';
            position: absolute;
            top: -12px;
            left: 25px;
            border-width: 0 12px 12px 12px;
            border-style: solid;
            border-color: transparent transparent #E0F2FE transparent;
        }
        .nav-button {
            background-color: #FBBF24;
            color: #78350F;
            transition: all 0.3s ease;
        }
        .nav-button:hover {
            background-color: #F59E0B;
            transform: translateY(-1px);
        }
        .step-indicator {
            opacity: 0.5;
            transition: opacity 0.3s ease;
        }
        .step-indicator.active {
            opacity: 1;
        }
        .discussion-section {
            display: none;
            border-left: 4px solid #10B981;
            background: linear-gradient(to right, #D1FAE5, #ECFDF5);
        }
        .discussion-section.active {
            display: block;
            animation: slideIn 0.5s ease-out;
        }
        .teacher-summary {
            display: none;
            background: linear-gradient(to right, #DBEAFE, #EFF6FF);
            border-left: 4px solid #3B82F6;
        }
        .teacher-summary.active {
            display: block;
            animation: slideIn 0.5s ease-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
        .page-divider {
            background: linear-gradient(to right, #FBBF24, #F59E0B, #FBBF24);
            height: 3px;
            margin: 2rem 0;
        }
    </style>
</head>
<body class="text-gray-800">

    <!-- 상단 내비게이션 -->
    <nav class="sticky top-0 z-50 bg-amber-200 shadow-lg p-3">
        <div class="container mx-auto">
            <div class="flex flex-wrap justify-center space-x-2 sm:space-x-3 md:space-x-4 mb-2">
                <button onclick="scrollToSection('intro')" class="nav-button text-xs sm:text-sm font-semibold py-2 px-3 rounded-lg">🏠 수업 시작</button>
                <button onclick="scrollToSection('story')" class="nav-button text-xs sm:text-sm font-semibold py-2 px-3 rounded-lg">📖 이야기</button>
                <button onclick="scrollToSection('page1-activities')" class="nav-button text-xs sm:text-sm font-semibold py-2 px-3 rounded-lg">📝 1페이지 활동</button>
                <button onclick="scrollToSection('page2-activities')" class="nav-button text-xs sm:text-sm font-semibold py-2 px-3 rounded-lg">🌟 2페이지 활동</button>
                <button onclick="scrollToSection('teacher-controls')" class="nav-button text-xs sm:text-sm font-semibold py-2 px-3 rounded-lg">👩‍🏫 교사용</button>
            </div>
            <!-- 진행 단계 표시 -->
            <div class="flex justify-center space-x-4 text-xs">
                <span id="step1" class="step-indicator active">1단계: 이야기 탐색</span>
                <span id="step2" class="step-indicator">2단계: 마음 분석</span>
                <span id="step3" class="step-indicator">3단계: 탐구 활동</span>
                <span id="step4" class="step-indicator">4단계: 성찰 정리</span>
            </div>
        </div>
    </nav>

    <div class="container mx-auto p-4 md:p-8 max-w-5xl">

        <!-- 도입 섹션 -->
        <section id="intro" class="text-center py-8 md:py-12">
            <img src="https://placehold.co/150x150/FBBF24/78350F?text=꿀꿀이들" alt="아기 돼지 삼형제" class="mx-auto mb-6 rounded-full shadow-lg" onerror="this.src='https://placehold.co/150x150/CCCCCC/333333?text=이미지없음';">
            <h1 class="text-3xl md:text-4xl font-bold section-title mb-4">🐷 아기 돼지 삼 형제</h1>
            <p class="text-lg md:text-xl text-amber-700 mb-6">마음을 읽는 교실</p>
            <div class="bg-amber-100 p-4 rounded-lg max-w-2xl mx-auto">
                <p class="text-gray-700 text-sm md:text-base">📋 <strong>준비물:</strong> 학습지 1페이지, 2페이지</p>
                <p class="text-gray-700 text-sm md:text-base mt-2">⏰ <strong>수업 시간:</strong> 40분 (1페이지 25분 + 2페이지 15분)</p>
            </div>
        </section>

        <!-- 이야기 섹션 -->
        <section id="story" class="py-8 md:py-12">
            <h2 class="text-2xl md:text-3xl font-bold section-title text-center mb-8">📖 아기 돼지 삼 형제 이야기</h2>
            <div class="bg-white p-6 rounded-xl shadow-lg mb-6">
                <div class="grid md:grid-cols-3 gap-6">
                    <div class="text-center">
                        <img src="https://placehold.co/120x120/FFC0CB/333333?text=첫째돼지" alt="첫째 돼지" class="w-20 h-20 mx-auto rounded-full border-4 border-pink-300 mb-3 shadow-md">
                        <h3 class="text-lg font-semibold text-pink-600 mb-2">첫째 돼지</h3>
                        <p class="text-sm text-gray-600">짚으로 뚝딱 집을 지었어요</p>
                    </div>
                    <div class="text-center">
                        <img src="https://placehold.co/120x120/A0E6FF/333333?text=둘째돼지" alt="둘째 돼지" class="w-20 h-20 mx-auto rounded-full border-4 border-blue-300 mb-3 shadow-md">
                        <h3 class="text-lg font-semibold text-blue-600 mb-2">둘째 돼지</h3>
                        <p class="text-sm text-gray-600">나무로 조금 더 튼튼하게</p>
                    </div>
                    <div class="text-center">
                        <img src="https://placehold.co/120x120/90EE90/333333?text=셋째돼지" alt="셋째 돼지" class="w-20 h-20 mx-auto rounded-full border-4 border-green-300 mb-3 shadow-md">
                        <h3 class="text-lg font-semibold text-green-600 mb-2">셋째 돼지</h3>
                        <p class="text-sm text-gray-600">벽돌로 튼튼하고 안전하게</p>
                    </div>
                </div>
                <div class="mt-6 text-center">
                    <p class="text-gray-700 leading-relaxed">늑대가 나타나 첫째와 둘째의 집을 날려버렸지만, 셋째의 벽돌집에서 삼 형제가 함께 늑대를 물리쳤답니다!</p>
                </div>
            </div>
        </section>

        <!-- 페이지 구분선 -->
        <div class="page-divider"></div>
        <div class="text-center my-6">
            <h2 class="text-2xl font-bold text-amber-600">📄 학습지 1페이지 활동 (25분)</h2>
        </div>

        <!-- 1페이지 활동: 돼지들의 마음 알아보기 -->
        <section id="page1-activities" class="py-6">
            <div class="bg-red-500 text-white p-4 rounded-lg mb-6">
                <h3 class="text-xl font-bold">1️⃣ 돼지들의 마음 알아보기 💭</h3>
                <p class="text-sm mt-2">각 돼지의 마음속 이야기를 들어보고, 학습지에 생각을 적어보세요!</p>
            </div>

            <div class="space-y-6">
                <!-- 첫째 돼지 -->
                <div class="pig-card p-6 rounded-xl flex items-start space-x-4">
                    <img src="https://placehold.co/80x80/FFC0CB/333333?text=첫째" alt="첫째 돼지" class="w-16 h-16 rounded-full border-3 border-pink-400 shadow-md">
                    <div class="flex-1">
                        <h4 class="text-lg font-semibold text-pink-600 mb-2">🔍 첫째 돼지의 마음</h4>
                        <p class="text-gray-700 mb-3">"왜 나만 참아야 해? 동생들 돌보는 것도 귀찮고..."</p>
                        <button onclick="toggleThought('thought1')" class="bg-pink-500 text-white py-2 px-4 rounded-lg hover:bg-pink-600 transition duration-300">💭 마음속 이야기 들어보기</button>
                        <div id="thought1" class="thought-bubble">
                            <p><strong>첫째 돼지의 속마음:</strong> "빨리 집 짓고 노는 게 최고야! 다른 애들은 뭘 저렇게 오래 걸린담? 나는 동생들 돌보는 것도 귀찮고, 내 물건 망가뜨리는 것도 싫어. 어른들은 나한테만 모범을 보이라고 하니 스트레스 받아!"</p>
                        </div>
                        <div class="mt-4 p-3 bg-yellow-50 rounded-lg border border-yellow-200">
                            <p class="text-sm text-yellow-800">📝 <strong>학습지 Q1</strong>: 첫째 돼지는 왜 이런 마음을 가졌을까요? (2분간 생각하고 적어보세요)</p>
                        </div>
                    </div>
                </div>

                <!-- 둘째 돼지 -->
                <div class="pig-card p-6 rounded-xl flex items-start space-x-4">
                    <img src="https://placehold.co/80x80/A0E6FF/333333?text=둘째" alt="둘째 돼지" class="w-16 h-16 rounded-full border-3 border-blue-400 shadow-md">
                    <div class="flex-1">
                        <h4 class="text-lg font-semibold text-blue-600 mb-2">🔍 둘째 돼지의 마음</h4>
                        <p class="text-gray-700 mb-3">"형도 동생도 내 마음은 몰라줘. 나만 손해 보는 것 같아..."</p>
                        <button onclick="toggleThought('thought2')" class="bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600 transition duration-300">💭 마음속 이야기 들어보기</button>
                        <div id="thought2" class="thought-bubble">
                            <p><strong>둘째 돼지의 속마음:</strong> "나는 중간이라 힘들어. 형 말도 들어야 하고, 동생한테 양보도 해야 하고... 형은 심부름시키고 동생은 떼쓰고. 내가 제일 손해 보는 것 같아. 내 마음은 아무도 몰라줘."</p>
                        </div>
                        <div class="mt-4 p-3 bg-yellow-50 rounded-lg border border-yellow-200">
                            <p class="text-sm text-yellow-800">📝 <strong>학습지 Q2</strong>: 둘째 돼지는 왜 이런 마음을 가졌을까요? (2분간 생각하고 적어보세요)</p>
                        </div>
                    </div>
                </div>

                <!-- 셋째 돼지 -->
                <div class="pig-card p-6 rounded-xl flex items-start space-x-4">
                    <img src="https://placehold.co/80x80/90EE90/333333?text=셋째" alt="셋째 돼지" class="w-16 h-16 rounded-full border-3 border-green-400 shadow-md">
                    <div class="flex-1">
                        <h4 class="text-lg font-semibold text-green-600 mb-2">🔍 셋째 돼지의 마음</h4>
                        <p class="text-gray-700 mb-3">"나도 다 컸는데 왜 아직도 어린애 취급이야? 내 의견도 중요하다고!"</p>
                        <button onclick="toggleThought('thought3')" class="bg-green-500 text-white py-2 px-4 rounded-lg hover:bg-green-600 transition duration-300">💭 마음속 이야기 들어보기</button>
                        <div id="thought3" class="thought-bubble">
                            <p><strong>셋째 돼지의 속마음:</strong> "나는 왜 맨날 형들 쓰던 것만 물려받아야 해? 나도 새것 갖고 싶다고! 그리고 나도 다 컸는데 왜 아직도 어린애 취급이야? 내 의견도 중요하단 말이야!"</p>
                        </div>
                        <div class="mt-4 p-3 bg-yellow-50 rounded-lg border border-yellow-200">
                            <p class="text-sm text-yellow-800">📝 <strong>학습지 Q3</strong>: 셋째 돼지는 왜 이런 마음을 가졌을까요? (2분간 생각하고 적어보세요)</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 탐구 질문 섹션 -->
        <section class="py-6">
            <div class="bg-amber-500 text-white p-4 rounded-lg mb-6">
                <h3 class="text-xl font-bold">2️⃣ 생각해보는 시간 🤔</h3>
                <p class="text-sm mt-2">각 질문마다 개별 생각 → 모둠 토론 → 전체 정리 순서로 진행해요!</p>
            </div>

            <!-- 탐구 질문 1 -->
            <div class="mb-8 bg-white rounded-xl shadow-lg p-6">
                <h4 class="text-lg font-semibold text-amber-700 mb-4">📝 탐구 질문 1</h4>
                <p class="text-gray-800 font-medium mb-4">서로의 마음을 이해하는 것이 왜 중요할까요?</p>
                
                <div class="bg-yellow-50 p-4 rounded-lg mb-4">
                    <p class="text-sm text-yellow-800">💭 <strong>1단계:</strong> 학습지에 내 생각을 먼저 적어보세요 (2분)</p>
                </div>
                
                <button id="discuss-btn1" onclick="showDiscussion('discussion1')" class="bg-green-500 text-white py-2 px-4 rounded-lg hover:bg-green-600 transition mb-4" style="display:none;">
                    🗣️ 모둠 토론 완료! 정리 내용 보기
                </button>
                
                <div id="discussion1" class="discussion-section p-4 rounded-lg">
                    <h5 class="font-semibold text-green-800 mb-2">👥 모둠 토론 후 새로 알게 된 점을 학습지에 적어보세요!</h5>
                    <button onclick="showTeacherSummary('summary1')" class="bg-blue-500 text-white py-2 px-3 rounded hover:bg-blue-600 transition">
                        👩‍🏫 선생님 정리 보기
                    </button>
                </div>

                <div id="summary1" class="teacher-summary p-4 rounded-lg mt-4">
                    <h5 class="font-semibold text-blue-800 mb-2">✨ 선생님의 정리</h5>
                    <p class="text-gray-700">서로의 생각과 감정을 이해하려고 노력하면 오해를 줄이고 더 사이좋게 지낼 수 있어요. 아기 돼지 삼 형제도 처음에는 각자 자기 생각만 했지만, 어려움을 함께 겪으면서 서로를 이해하게 되었죠.</p>
                </div>
            </div>

            <!-- 탐구 질문 2 -->
            <div class="mb-8 bg-white rounded-xl shadow-lg p-6">
                <h4 class="text-lg font-semibold text-amber-700 mb-4">📝 탐구 질문 2</h4>
                <p class="text-gray-800 font-medium mb-4">갈등이 생겼을 때 어떻게 해결하면 좋을까요?</p>
                
                <div class="bg-yellow-50 p-4 rounded-lg mb-4">
                    <p class="text-sm text-yellow-800">💭 <strong>1단계:</strong> 학습지에 내 생각을 먼저 적어보세요 (2분)</p>
                </div>
                
                <button id="discuss-btn2" onclick="showDiscussion('discussion2')" class="bg-green-500 text-white py-2 px-4 rounded-lg hover:bg-green-600 transition mb-4" style="display:none;">
                    🗣️ 모둠 토론 완료! 정리 내용 보기
                </button>
                
                <div id="discussion2" class="discussion-section p-4 rounded-lg">
                    <h5 class="font-semibold text-green-800 mb-2">👥 모둠 토론 후 새로 알게 된 점을 학습지에 적어보세요!</h5>
                    <button onclick="showTeacherSummary('summary2')" class="bg-blue-500 text-white py-2 px-3 rounded hover:bg-blue-600 transition">
                        👩‍🏫 선생님 정리 보기
                    </button>
                </div>

                <div id="summary2" class="teacher-summary p-4 rounded-lg mt-4">
                    <h5 class="font-semibold text-blue-800 mb-2">✨ 선생님의 정리</h5>
                    <p class="text-gray-700">화를 내거나 싸우기보다, 자신의 감정을 솔직하게 이야기하고 상대방의 이야기도 잘 들어주는 것이 중요해요. "나는 네가 이래서 속상했어. 다음에는 이렇게 해주면 좋겠어." 라고 차분히 말해보세요.</p>
                </div>
            </div>

            <!-- 탐구 질문 3 -->
            <div class="mb-8 bg-white rounded-xl shadow-lg p-6">
                <h4 class="text-lg font-semibold text-amber-700 mb-4">📝 탐구 질문 3</h4>
                <p class="text-gray-800 font-medium mb-4">함께 힘을 합치면 어떤 점이 좋을까요?</p>
                
                <div class="bg-yellow-50 p-4 rounded-lg mb-4">
                    <p class="text-sm text-yellow-800">💭 <strong>1단계:</strong> 학습지에 내 생각을 먼저 적어보세요 (2분)</p>
                </div>
                
                <button id="discuss-btn3" onclick="showDiscussion('discussion3')" class="bg-green-500 text-white py-2 px-4 rounded-lg hover:bg-green-600 transition mb-4" style="display:none;">
                    🗣️ 모둠 토론 완료! 정리 내용 보기
                </button>
                
                <div id="discussion3" class="discussion-section p-4 rounded-lg">
                    <h5 class="font-semibold text-green-800 mb-2">👥 모둠 토론 후 새로 알게 된 점을 학습지에 적어보세요!</h5>
                    <button onclick="showTeacherSummary('summary3')" class="bg-blue-500 text-white py-2 px-3 rounded hover:bg-blue-600 transition">
                        👩‍🏫 선생님 정리 보기
                    </button>
                </div>

                <div id="summary3" class="teacher-summary p-4 rounded-lg mt-4">
                    <h5 class="font-semibold text-blue-800 mb-2">✨ 선생님의 정리</h5>
                    <p class="text-gray-700">혼자서는 하기 어려운 일도 함께 힘을 합치면 쉽게 해결할 수 있어요. 아기 돼지 삼 형제도 막내의 튼튼한 벽돌집 덕분에, 그리고 함께 있었기에 늑대를 물리칠 수 있었답니다.</p>
                </div>
            </div>
        </section>

        <!-- 페이지 구분선 -->
        <div class="page-divider"></div>
        <div class="text-center my-6">
            <h2 class="text-2xl font-bold text-green-600">📄 학습지 2페이지 활동 (15분)</h2>
            <p class="text-gray-600 mt-2">이제 2페이지를 나눠드릴게요!</p>
        </div>

        <!-- 2페이지 활동 -->
        <section id="page2-activities" class="py-6">
            <div class="bg-green-500 text-white p-4 rounded-lg mb-6">
                <h3 class="text-xl font-bold">3️⃣ 나의 경험과 연결하기 🌟</h3>
                <p class="text-sm mt-2">나의 이야기와 연결해서 생각해보는 시간이에요!</p>
            </div>

            <div class="grid md:grid-cols-2 gap-6 mb-8">
                <div class="bg-white p-6 rounded-xl shadow-lg">
                    <h4 class="text-lg font-semibold text-green-600 mb-4">💭 나와 비슷한 돼지 찾기</h4>
                    <p class="text-gray-700 mb-4">세 돼지 중 나와 가장 비슷한 마음을 가진 돼지를 학습지에서 선택해보세요.</p>
                    <div class="space-y-3 text-sm">
                        <div class="flex items-center space-x-2">
                            <div class="w-4 h-4 bg-pink-300 rounded-full"></div>
                            <span>첫째 돼지 - 책임감과 부담감</span>
                        </div>
                        <div class="flex items-center space-x-2">
                            <div class="w-4 h-4 bg-blue-300 rounded-full"></div>
                            <span>둘째 돼지 - 중간에 끼인 어려움</span>
                        </div>
                        <div class="flex items-center space-x-2">
                            <div class="w-4 h-4 bg-green-300 rounded-full"></div>
                            <span>셋째 돼지 - 인정받고 싶은 마음</span>
                        </div>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-xl shadow-lg">
                    <h4 class="text-lg font-semibold text-green-600 mb-4">🤝 나의 화해 경험</h4>
                    <p class="text-gray-700 mb-4">형제자매나 친구와 다투었다가 화해한 경험을 학습지에 적어보세요.</p>
                    <div class="space-y-2 text-sm text-gray-600">
                        <p>• 언제, 누구와 다퉜나요?</p>
                        <p>• 왜 다퉜나요?</p>
                        <p>• 어떻게 화해했나요?</p>
                    </div>
                </div>
            </div>

            <div class="bg-white p-6 rounded-xl shadow-lg mb-8">
                <h4 class="text-lg font-semibold text-green-600 mb-4">✨ 오늘의 다짐</h4>
                <p class="text-gray-700 mb-4">오늘 이야기를 듣고 앞으로 어떻게 행동하고 싶은지 학습지에 적어보세요.</p>
                <div class="grid md:grid-cols-2 gap-4 text-sm">
                    <div class="bg-green-50 p-3 rounded">
                        <p class="font-medium text-green-800">가족과 함께 있을 때</p>
                    </div>
                    <div class="bg-green-50 p-3 rounded">
                        <p class="font-medium text-green-800">친구들과 함께 있을 때</p>
                    </div>
                </div>
            </div>

            <!-- 선생님과 함께 정리하기 -->
            <div class="bg-purple-500 text-white p-4 rounded-lg mb-6">
                <h3 class="text-xl font-bold">4️⃣ 선생님과 함께 정리하기 📚</h3>
                <p class="text-sm mt-2">오늘 배운 중요한 것들을 함께 정리해봐요!</p>
            </div>

            <div class="space-y-6">
                <div class="bg-white p-6 rounded-xl shadow-lg">
                    <h4 class="text-lg font-semibold text-purple-600 mb-3">🎯 오늘 배운 중요한 것들</h4>
                    <div class="space-y-4">
                        <div class="border-l-4 border-purple-400 pl-4">
                            <h5 class="font-medium text-gray-800">1. 서로의 마음 이해하기</h5>
                            <p class="text-sm text-gray-600 mt-1">선생님 설명을 들으며 학습지에 정리해보세요</p>
                        </div>
                        <div class="border-l-4 border-purple-400 pl-4">
                            <h5 class="font-medium text-gray-800">2. 갈등 해결 방법</h5>
                            <p class="text-sm text-gray-600 mt-1">선생님 설명을 들으며 학습지에 정리해보세요</p>
                        </div>
                        <div class="border-l-4 border-purple-400 pl-4">
                            <h5 class="font-medium text-gray-800">3. 함께 힘을 합치는 것의 좋은 점</h5>
                            <p class="text-sm text-gray-600 mt-1">선생님 설명을 들으며 학습지에 정리해보세요</p>
                        </div>
                    </div>
                </div>

                <div class="bg-white p-6 rounded-xl shadow-lg">
                    <h4 class="text-lg font-semibold text-green-600 mb-4">🌈 소감 한 마디</h4>
                    <p class="text-gray-700">오늘 수업을 듣고 느낀 점을 학습지에 한 줄로 적어보세요.</p>
                </div>
            </div>
        </section>

        <!-- 교사용 컨트롤 섹션 -->
        <section id="teacher-controls" class="py-8 bg-gray-100 rounded-xl">
            <h3 class="text-2xl font-bold text-center text-gray-700 mb-6">👩‍🏫 교사용 컨트롤</h3>
            <div class="grid md:grid-cols-2 gap-4 max-w-4xl mx-auto">
                <div class="bg-white p-4 rounded-lg">
                    <h4 class="font-semibold mb-3">1페이지 활동 단계별 진행</h4>
                    <div class="space-y-2">
                        <button onclick="activateStep('step2')" class="w-full bg-red-500 text-white py-2 rounded hover:bg-red-600 transition">1단계: 돼지 마음 분석 시작</button>
                        <button onclick="showAllDiscussButtons()" class="w-full bg-amber-500 text-white py-2 rounded hover:bg-amber-600 transition">2단계: 탐구 토론 버튼 활성화</button>
                        <button onclick="activateStep('step3')" class="w-full bg-green-500 text-white py-2 rounded hover:bg-green-600 transition">3단계: 탐구 활동 완료</button>
                    </div>
                </div>
                <div class="bg-white p-4 rounded-lg">
                    <h4 class="font-semibold mb-3">2페이지 활동 진행</h4>
                    <div class="space-y-2">
                        <button onclick="activateStep('step4')" class="w-full bg-purple-500 text-white py-2 rounded hover:bg-purple-600 transition">4단계: 성찰 및 정리 시작</button>
                        <button onclick="scrollToSection('page2-activities')" class="w-full bg-blue-500 text-white py-2 rounded hover:bg-blue-600 transition">2페이지 섹션으로 이동</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- 마무리 -->
        <footer class="text-center py-8 mt-8">
            <div class="bg-amber-100 p-6 rounded-xl">
                <h3 class="text-xl font-bold text-amber-700 mb-2">🎉 수고했어요!</h3>
                <p class="text-gray-600">오늘 함께 돼지 삼 형제의 마음을 알아보고, 서로를 이해하는 방법을 배웠어요.</p>
            </div>
        </footer>

    </div>

    <script>
        function toggleThought(id) {
            const thoughtBubble = document.getElementById(id);
            thoughtBubble.classList.toggle('active');
        }

        function showDiscussion(id) {
            const discussion = document.getElementById(id);
            discussion.classList.add('active');
        }

        function showTeacherSummary(id) {
            const summary = document.getElementById(id);
            summary.classList.add('active');
        }

        function showAllDiscussButtons() {
            document.getElementById('discuss-btn1').style.display = 'inline-block';
            document.getElementById('discuss-btn2').style.display = 'inline-block';
            document.getElementById('discuss-btn3').style.display = 'inline-block';
        }

        function activateStep(stepId) {
            // 모든 단계 비활성화
            document.querySelectorAll('.step-indicator').forEach(step => {
                step.classList.remove('active');
            });
            // 해당 단계 활성화
            document.getElementById(stepId).classList.add('active');
        }

        function scrollToSection(sectionId) {
            const section = document.getElementById(sectionId);
            if (section) {
                section.scrollIntoView({ behavior: 'smooth' });
            }
        }
    </script>

</body>
</html>
