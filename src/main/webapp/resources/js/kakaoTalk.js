//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('51156471e08365ee7565955a15afe32f');
// 카카오톡 채널 1:1채팅 버튼을 생성합니다.
Kakao.Channel.createChatButton({
	container: '#kakao-talk-channel-chat-button',
	channelPublicId: '_NIxgxoxb' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
});
//]]>

$('document').ready(() => {
	$('#kakao-talk-channel-chat-button > a > img').attr('src', 'resources/img/kakaoTalk/kakaoCh.jpg');
	$('#kakao-talk-channel-chat-button').show();
})