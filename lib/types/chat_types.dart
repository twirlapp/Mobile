import 'telegram_types.dart';
import 'message_types.dart';

abstract class ChatType {}

class ChatTypeBasicGroup implements ChatType {
  int basicGroupId;

  ChatTypeBasicGroup(this.basicGroupId);
}

class ChatTypePrivate implements ChatType {
  int userId;

  ChatTypePrivate(this.userId);
}

class ChatTypeSecret implements ChatType {
  int secretChatId;
  int userId;

  ChatTypeSecret(this.secretChatId, this.userId);
}

class ChatTypeSuperGroup implements ChatType {
  int superGroupId;
  bool isChannel;

  ChatTypeSuperGroup(this.superGroupId, this.isChannel);
}

class ChatPhoto {
  File small;
  File big;

  ChatPhoto(this.small, this.big);

}

class Chat {
  int chatId;
  ChatType chatType;
  String title;
  String username;
  ChatPhoto chatPhoto;
  Message lastMessage;
  int order;
  bool isPinned;
  bool isMarkedAsUnread;
  bool canBeReported;
  bool defaultDisableNotification;
  int unreadCount;
  int lastReadInboxMessageId;
  int lastReadOutboxMessageId;
  int unreadMentionCount;
  ChatNotificationSettings notificationSettings;
  int replyMarkupMessageId;
  DraftMessage draftMessage;
  String clientData;

  Chat(this.chatId,
      this.chatType,
      this.title,
      this.order,
      this.isPinned,
      this.isMarkedAsUnread,
      this.canBeReported,
      {this.username, this.chatPhoto,
        this.lastMessage, this.defaultDisableNotification, this.unreadCount,
        this.lastReadInboxMessageId, this.lastReadOutboxMessageId,
        this.unreadMentionCount, this.notificationSettings,
        this.replyMarkupMessageId, this.draftMessage, this.clientData}
        );

}

class ChatNotificationSettings {
  bool useDefaultMuteFor;
  int muteFor;
  bool useDefaultSound;
  String defaultSound;
  bool useDefaultShowPreview;
  bool showPreview;

  ChatNotificationSettings({this.useDefaultMuteFor, this.muteFor,
    this.useDefaultSound, this.defaultSound, this.useDefaultShowPreview,
    this.showPreview});
}