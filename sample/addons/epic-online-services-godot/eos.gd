# Copyright (c) 2023-present Delano Lourenco
# https://github.com/3ddelano/epic-online-services-godot/
# MIT License

extends RefCounted
class_name EOS


static func get_instance():
	return IEOS

class Achievements:
	class CopyAchievementDefinitionV2ByAchievementIdOptions extends BaseClass:
		func _init():
			super._init("CopyAchievementDefinitionV2ByAchievementIdOptions")

		var achievement_id: String

	class CopyAchievementDefinitionV2ByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyAchievementDefinitionV2ByIndexOptions")

		var achievement_index: int

	class CopyPlayerAchievementByAchievementIdOptions extends BaseClass:
		func _init():
			super._init("CopyPlayerAchievementByAchievementIdOptions")

		var target_user_id: String
		var achievement_id: String
		var local_user_id: String

	class CopyPlayerAchievementByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyPlayerAchievementByIndexOptions")

		var target_user_id: String
		var achievement_index: int
		var local_user_id: String

	class GetAchievementDefinitionCountOptions extends BaseClass:
		func _init():
			super._init("GetAchievementDefinitionCountOptions")

	class QueryDefinitionsOptions extends BaseClass:
		func _init():
			super._init("QueryDefinitionsOptions")

		var local_user_id = ""

		var client_data = null

	class GetPlayerAchievementCountOptions extends BaseClass:
		func _init():
			super._init("GetPlayerAchievementCountOptions")

		var user_id: String

	class QueryPlayerAchievementsOptions extends BaseClass:
		func _init():
			super._init("QueryPlayerAchievementsOptions")

		var target_user_id: String
		var local_user_id: String

		var client_data = null

	class UnlockAchievementsOptions extends BaseClass:
		func _init():
			super._init("UnlockAchievementsOptions")

		var user_id: String
		var achievement_ids = []  # [String]
		var client_data = null

	class AchievementsInterface:
		static func query_definitions(options: QueryDefinitionsOptions) -> void:
			IEOS.achievements_interface_query_definitions(options)

		static func get_achievement_definition_count(options: GetAchievementDefinitionCountOptions) -> int:
			return IEOS.achievements_interface_get_achievement_definition_count(options)

		static func copy_achievement_definition_v2_by_achievement_id(
			options: CopyAchievementDefinitionV2ByAchievementIdOptions
		) -> Dictionary:
			return IEOS.achievements_interface_copy_achievement_definition_v2_by_achievement_id(
				options
			)

		static func copy_achievement_definition_v2_by_index(
			options: CopyAchievementDefinitionV2ByIndexOptions
		) -> Dictionary:
			return IEOS.achievements_interface_copy_achievement_definition_v2_by_index(options)

		static func query_player_achievements(options: QueryPlayerAchievementsOptions) -> void:
			IEOS.achievements_interface_query_player_achievements(options)

		static func get_player_achievement_count(options: GetPlayerAchievementCountOptions) -> int:
			return IEOS.achievements_interface_get_player_achievement_count(options)

		static func copy_player_achievement_by_achievement_id(
			options: CopyPlayerAchievementByAchievementIdOptions
		) -> Dictionary:
			return IEOS.achievements_interface_copy_player_achievement_by_achievement_id(options)

		static func copy_player_achievement_by_index(options: CopyPlayerAchievementByIndexOptions) -> Dictionary:
			return IEOS.achievements_interface_copy_player_achievement_by_index(options)

		static func unlock_achievements(options: UnlockAchievementsOptions) -> void:
			IEOS.achievements_interface_unlock_achievements(options)


class Connect:
	class Credentials extends BaseClass:
		func _init():
			super._init("Credentials")

		var type: int  # ExternalCredentialType
		var token = null

	class UserLoginInfo extends BaseClass:
		func _init():
			super._init("UserLoginInfo")

		var display_name: String

	class LoginOptions extends BaseClass:
		func _init():
			super._init("LoginOptions")

		var credentials: Credentials
		var user_login_info = null  # UserLoginInfo

		var client_data = null

	class CopyIdTokenOptions extends BaseClass:
		func _init():
			super._init("CopyIdTokenOptions")

		var local_user_id: String

	class CopyProductUserExternalAccountByAccountIdOptions extends BaseClass:
		func _init():
			super._init("CopyProductUserExternalAccountByAccountIdOptions")

		var target_user_id: String
		var account_id: String

	class CopyProductUserExternalAccountByAccountTypeOptions extends BaseClass:
		func _init():
			super._init("CopyProductUserExternalAccountByAccountTypeOptions")

		var target_user_id: String
		var account_id_type: int  # ExternalAccountType

	class CopyProductUserExternalAccountByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyProductUserExternalAccountByIndexOptions")

		var target_user_id: String
		var external_account_info_index: int

	class CopyProductUserInfoOptions extends BaseClass:
		func _init():
			super._init("CopyProductUserInfoOptions")

		var target_user_id: String

	class CreateDeviceIdOptions extends BaseClass:
		func _init():
			super._init("CreateDeviceIdOptions")

		var device_model: String

		var client_data = null

	class DeleteDeviceIdOptions extends BaseClass:
		func _init():
			super._init("DeleteDeviceIdOptions")

		var client_data = null

	class CreateUserOptions extends BaseClass:
		func _init():
			super._init("CreateUserOptions")

		var continuance_token: RefCounted # ContinuanceTokenWrapper

		var client_data = null

	class GetExternalAccountMappingsOptions extends BaseClass:
		func _init():
			super._init("GetExternalAccountMappingsOptions")

		var local_user_id: String
		var account_id_type: int # ExternalAccountType
		var target_external_user_id: String

	class GetProductUserExternalAccountCountOptions extends BaseClass:
		func _init():
			super._init("GetProductUserExternalAccountCountOptions")

		var target_user_id: String

	class GetProductUserIdMappingOptions extends BaseClass:
		func _init():
			super._init("GetProductUserIdMappingOptions")

		var local_user_id: String
		var account_id_type: int # ExternalAccountType
		var target_product_user_id: String

	class LinkAccountOptions extends BaseClass:
		func _init():
			super._init("LinkAccountOptions")

		var continuance_token = null # ContinuanceTokenWrapper
		var local_user_id = null # String

		var client_data = null

	class IdToken extends BaseClass:
		func _init():
			super._init("IdToken")

		var product_user_id: String
		var json_web_token: String

	class VerifyIdTokenOptions extends BaseClass:
		func _init():
			super._init("VerifyIdTokenOptions")

		var id_token: IdToken

		var client_data = null

	class TransferDeviceIdAccountOptions extends BaseClass:
		func _init():
			super._init("TransferDeviceIdAccountOptions")

		var primary_local_user_id: String
		var local_device_user_id: String
		var product_user_id_to_preserve: String

		var client_data = null

	class UnlinkAccountOptions extends BaseClass:
		func _init():
			super._init("UnlinkAccountOptions")

		var local_user_id: String

		var client_data = null

	class ConnectInterface:
		static func login(options: LoginOptions) -> void:
			IEOS.connect_interface_login(options)

		static func copy_id_token(options: CopyIdTokenOptions) -> Dictionary:
			return IEOS.connect_interface_copy_id_token(options)

		static func copy_product_user_external_account_by_account_id(
			options: CopyProductUserExternalAccountByAccountIdOptions
		) -> Dictionary:
			return IEOS.connect_interface_copy_product_user_external_account_by_account_id(options)

		static func copy_product_user_external_account_by_account_type(
			options: CopyProductUserExternalAccountByAccountTypeOptions
		) -> Dictionary:
			return IEOS.connect_interface_copy_product_user_external_account_by_account_type(
				options
			)

		static func copy_product_user_external_account_by_index(
			options: CopyProductUserExternalAccountByIndexOptions
		) -> Dictionary:
			return IEOS.connect_interface_copy_product_user_external_account_by_index(options)

		static func copy_product_user_info(options: CopyProductUserInfoOptions) -> Dictionary:
			return IEOS.connect_interface_copy_product_user_info(options)

		static func create_device_id(options: CreateDeviceIdOptions) -> void:
			IEOS.connect_interface_create_device_id(options)

		static func create_user(options: CreateUserOptions) -> void:
			IEOS.connect_interface_create_user(options)

		static func delete_device_id(options: DeleteDeviceIdOptions) -> void:
			IEOS.connect_interface_delete_device_id(options)

		static func get_external_account_mapping(options: GetExternalAccountMappingsOptions) -> String:
			return IEOS.connect_interface_get_external_account_mapping(options)

		static func get_logged_in_user_by_index(index: int) -> String:
			return IEOS.connect_interface_get_logged_in_user_by_index(index)

		static func get_logged_in_users_count() -> int:
			return IEOS.connect_interface_get_logged_in_users_count()

		static func get_login_status(local_user_id: String) -> int:
			return IEOS.connect_interface_get_login_status(local_user_id)

		static func get_product_user_external_account_count(options: GetProductUserExternalAccountCountOptions) -> int:
			return IEOS.connect_interface_get_product_user_external_account_count(options)

		static func get_product_user_id_mapping(options: GetProductUserIdMappingOptions):
			return IEOS.connect_interface_get_product_user_id_mapping(options)

		static func link_account(options: LinkAccountOptions) -> void:
			IEOS.connect_interface_link_account(options)

		static func verify_id_token(options: VerifyIdTokenOptions) -> void:
			IEOS.connect_interface_verify_id_token(options)

		static func transfer_device_id_account(options: TransferDeviceIdAccountOptions) -> void:
			IEOS.connect_interface_transfer_device_id_account(options)

		static func unlink_account(options: UnlinkAccountOptions) -> void:
			IEOS.connect_interface_unlink_account(options)


class Auth:
	enum ScopeFlags {
		NoFlags = 0x0,
		BasicProfile = 0x1,
		FriendsList = 0x2,
		Presence = 0x4,
		FriendsManagement = 0x8,
		Email = 0x10
	}

	enum AuthTokenType { Client = 0, User = 1 }

	enum LinkAccountFlags { NoFlags = 0x0, NintendoNsaId = 0x1 }

	enum LoginCredentialType {
		Password = 0,
		ExchangeCode = 1,
		PersistentAuth = 2,
		DeviceCode = 3,
		Developer = 4,
		RefreshToken = 5,
		AccountPortal = 6,
		ExternalAuth = 7
	}

	class LoginOptions extends BaseClass:
		func _init():
			super._init("LoginOptions")

		var type: int
		var credentials: Credentials
		var scope_flags: int

		var client_data = null

	class LogoutOptions extends BaseClass:
		func _init():
			super._init("LogoutOptions")

		var local_user_id: String

		var client_data = null

	class Credentials extends BaseClass:
		func _init():
			super._init("Credentials")

		var type: int  # LoginCredentialType
		var id = null  # String
		var token = null  # String
		var external_type = null  # ExternalCredentialType

	class CopyIdTokenOptions extends BaseClass:
		func _init():
			super._init("CopyIdTokenOptions")

		var account_id: String

	class CopyUserAuthTokenOptions extends BaseClass:
		func _init():
			super._init("CopyUserAuthTokenOptions")

	class DeletePersistentAuthOptions extends BaseClass:
		func _init():
			super._init("DeletePersistentAuthOptions")

		var refresh_token = null
		var client_data = null

	class LinkAccountOptions extends BaseClass:
		func _init():
			super._init("LinkAccountOptions")

		var link_account_flags: int # LinkAccountFlags
		var continuance_token: RefCounted # ContinuanceTokenWrapper
		var local_user_id: String

		var client_data = null

	class QueryIdTokenOptions extends BaseClass:
		func _init():
			super._init("QueryIdTokenOptions")

		var local_user_id: String
		var target_account_id: String

		var client_data = null

	class IdToken extends BaseClass:
		func _init():
			super._init("IdToken")

		var account_id: String
		var json_web_token: String

	class VerifyIdTokenOptions extends BaseClass:
		func _init():
			super._init("VerifyIdTokenOptions")

		var id_token: IdToken

		var client_data = null

	class Token extends BaseClass:
		func _init():
			super._init("Token")

		var app: String
		var client_id: String
		var account_id: String
		var access_token: String
		var expires_in: float
		var expires_at: String
		var auth_type: int
		var refresh_token: String
		var refresh_expires_in: float
		var refresh_expires_at: String

	class VerifyUserAuthOptions extends BaseClass:
		func _init():
			super._init("VerifyUserAuthOptions")

		var auth_token: Token

		var client_data = null

	class AuthInterface:
		static func login(options: LoginOptions) -> void:
			IEOS.auth_interface_login(options)

		static func logout(options: LogoutOptions) -> void:
			IEOS.auth_interface_logout(options)

		static func copy_id_token(options: CopyIdTokenOptions) -> Dictionary:
			return IEOS.auth_interface_copy_id_token(options)

		static func copy_user_auth_token(options: CopyUserAuthTokenOptions, local_user_id: String) -> Dictionary:
			var func_result: Dictionary = IEOS.auth_interface_copy_user_auth_token(
				options, local_user_id
			)
			var token: Token = Token.new()
			if func_result.token:
				var token_dict = func_result.token
				token.app = token_dict.app
				token.client_id = token_dict.client_id
				token.account_id = token_dict.account_id
				token.access_token = token_dict.access_token
				token.expires_in = token_dict.expires_in
				token.expires_at = token_dict.expires_at
				token.auth_type = token_dict.auth_type
				token.refresh_token = token_dict.refresh_token
				token.refresh_expires_in = token_dict.refresh_expires_in
				token.refresh_expires_at = token_dict.refresh_expires_at

			return {result_code = func_result.result_code, token = token}

		static func delete_persistent_auth(options: DeletePersistentAuthOptions) -> void:
			IEOS.auth_interface_delete_persistent_auth(options)

		static func get_logged_in_account_by_index(index: int) -> String:
			return IEOS.auth_interface_get_logged_in_account_by_index(index)

		static func get_logged_in_accounts_count() -> int:
			return IEOS.auth_interface_get_logged_in_accounts_count()

		static func get_login_status(local_user_id: String) -> int:
			return IEOS.auth_interface_get_login_status(local_user_id)

		static func get_merged_account_by_index(local_user_id: String, index: int) -> String:
			return IEOS.auth_interface_get_merged_account_by_index(local_user_id, index)

		static func get_merged_accounts_count(local_user_id: String) -> int:
			return IEOS.auth_interface_get_merged_accounts_count(local_user_id)

		static func get_selected_account_id(local_user_id: String) -> Dictionary:
			return IEOS.auth_interface_get_selected_account_id(local_user_id)

		static func link_account(options: LinkAccountOptions) -> void:
			IEOS.auth_interface_link_account(options)

		static func query_id_token(options: QueryIdTokenOptions) -> void:
			IEOS.auth_interface_query_id_token(options)

		static func verify_id_token(options: VerifyIdTokenOptions) -> void:
			IEOS.auth_interface_verify_id_token(options)

		static func verify_user_auth(options: VerifyUserAuthOptions) -> void:
			IEOS.auth_interface_verify_user_auth(options)


class CustomInvites:

	class SetCustomInviteOptions extends BaseClass:
		func _init():
			super._init("SetCustomInviteOptions")

		var local_user_id: String
		var payload: String

	class SendCustomInviteOptions extends BaseClass:
		func _init():
			super._init("SendCustomInviteOptions")

		var local_user_id: String
		var target_user_ids = [] # [String]
		var client_data = null

	class FinalizeInviteOptions extends BaseClass:
		func _init():
			super._init("FinalizeInviteOptions")

		var target_user_id: String
		var local_user_id: String
		var custom_invite_id: String
		var processing_result: int # Result

	class CustomInvitesInterface:
		static func set_custom_invite(options: SetCustomInviteOptions) -> int:
			return IEOS.custom_invites_interface_set_custom_invite(options)

		static func send_custom_invite(options: SendCustomInviteOptions) -> void:
			IEOS.custom_invites_interface_send_custom_invite(options)

		static func finalize_invite(options: FinalizeInviteOptions) -> int:
			return IEOS.custom_invites_interface_finalize_invite(options)


class Stats:
	class CopyStatByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyStatByIndexOptions")

		var target_user_id: String
		var stat_index: int

	class CopyStatByNameOptions extends BaseClass:
		func _init():
			super._init("CopyStatByNameOptions")

		var target_user_id: String
		var name: String

	class GetStatsCountOptions extends BaseClass:
		func _init():
			super._init("GetStatsCountOptions")

		var target_user_id: String

	class IngestStatOptions extends BaseClass:
		func _init():
			super._init("IngestStatOptions")

		var local_user_id: String
		var target_user_id: String
		var stats: Array # IngestData: {stat_name: String, ingest_amount: int}

		var client_data = null

	class QueryStatsOptions extends BaseClass:
		func _init():
			super._init("QueryStatsOptions")

		var local_user_id: String
		var target_user_id: String
		var stat_names = null # [String]
		var start_time = null # String
		var end_time = null # String

		var client_data = null

	class StatsInterface:
		static func copy_stat_by_index(options: CopyStatByIndexOptions) -> Dictionary:
			return IEOS.stats_interface_copy_stat_by_index(options)

		static func copy_stat_by_name(options: CopyStatByNameOptions) -> Dictionary:
			return IEOS.stats_interface_copy_stat_by_name(options)

		static func get_stats_count(options: GetStatsCountOptions) -> int:
			return IEOS.stats_interface_get_stats_count(options)

		static func ingest_stat(options: IngestStatOptions) -> void:
			IEOS.stats_interface_ingest_stat(options)

		static func query_stats(options: QueryStatsOptions) -> void:
			IEOS.stats_interface_query_stats(options)


class Platform extends RefCounted:
	enum PlatformFlags {
		None = 0x0,
		LoadingInEditor = 0x00001,
		DisableOverlay = 0x00002,
		DisableSocialOverlay = 0x00004,
		Reserved1 = 0x00008,
		WindowsEnableOverlayD3D9 = 0x00010,
		WindowsEnableOverlayD3D10 = 0x00020,
		WindowsEnableOverlayOpengl = 0x00040
	}

	enum ApplicationStatus {
		BackgroundConstrained = 0,
		BackgroundUnconstrained = 1,
		BackgroundSuspended = 2,
		Foreground = 3
	}

	enum NetworkStatus {
		Disabled = 0,
		Offline = 1,
		Online = 2
	}

	enum DesktopCrossplayStatus {
		EOS_DCS_OK = 0,
		EOS_DCS_ApplicationNotBootstrapped = 1,
		EOS_DCS_ServiceNotInstalled = 2,
		EOS_DCS_ServiceStartFailed = 3,
		EOS_DCS_ServiceNotRunning = 4,
		EOS_DCS_OverlayDisabled = 5,
		EOS_DCS_OverlayNotInstalled = 6,
		EOS_DCS_OverlayTrustCheckFailed = 7,
		EOS_DCS_OverlayLoadFailed = 8
	}

	class InitializeOptions extends BaseClass:
		func _init():
			super._init("InitializeOptions")

		var product_name: String
		var product_version: String

	class CreateOptions extends BaseClass:
		func _init():
			super._init("CreateOptions")

		var product_id: String
		var sandbox_id: String
		var deployment_id: String
		var client_id: String
		var client_secret: String
		var encryption_key: String

		var is_server: bool
		var override_locale_code: String
		var override_country_code: String
		var flags: int = -1
		var tick_budget_in_milliseconds: int
		# TODO: implement rtc_options in GDScript
		# var rtc_options: RTCOptions


	class PlatformInterface extends RefCounted:
		static func create(options: CreateOptions) -> bool:
			return IEOS.platform_interface_create(options)

		static func get_active_country_code(user_id: String) -> Dictionary:
			return IEOS.platform_interface_get_active_country_code(user_id)

		static func get_active_locale_code(user_id: String) -> Dictionary:
			return IEOS.platform_interface_get_active_locale_code(user_id)

		static func get_override_country_code() -> Dictionary:
			return IEOS.platform_interface_get_override_country_code()

		static func get_override_locale_code() -> Dictionary:
			return IEOS.platform_interface_get_override_locale_code()

		static func set_override_country_code(country_code: String) -> int:
			return IEOS.platform_interface_set_override_country_code(country_code)

		static func set_override_locale_code(locale_code: String) -> int:
			return IEOS.platform_interface_set_override_locale_code(locale_code)

		static func check_for_launcher_and_restart() -> int:
			return IEOS.platform_interface_check_for_launcher_and_restart()

		static func initialize(options: InitializeOptions) -> int:
			return IEOS.platform_interface_initialize(options)

		static func get_desktop_crossplay_status() -> Dictionary:
			return IEOS.platform_interface_get_desktop_crossplay_status()

		static func set_application_status(status: ApplicationStatus) -> int:
			return IEOS.platform_interface_set_application_status(status)

		static func get_application_status() -> int:
			return IEOS.platform_interface_get_application_status()

		static func set_network_status(status: ApplicationStatus) -> int:
			return IEOS.platform_interface_set_network_status(status)

		static func get_network_status() -> int:
			return IEOS.platform_interface_get_network_status()

		static func release() -> void:
			IEOS.platform_interface_release()

		static func shutdown() -> int:
			return IEOS.platform_interface_shutdown()


class Ecom:
	enum ItemType { Durable = 0, Consumable = 1, Other = 2 }

	enum OwnershipStatus { NotOwned = 0, Owned = 1 }

	class CheckoutOptions extends BaseClass:
		func _init():
			super._init("CheckoutOptions")

		var local_user_id: String
		var entries: Array # [{offer_id: String}]
		var override_catalog_namespace = null # String

	class CopyEntitlementByIdOptions extends BaseClass:
		func _init():
			super._init("CopyEntitlementByIdOptions")

		var local_user_id: String
		var entitlement_id: String

	class CopyEntitlementByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyEntitlementByIndexOptions")

		var local_user_id: String
		var entitlement_index: int

	class CopyEntitlementByNameAndIndexOptions extends BaseClass:
		func _init():
			super._init("CopyEntitlementByNameAndIndexOptions")

		var local_user_id: String
		var entitlement_name: String
		var index: int

	class CopyItemByIdOptions extends BaseClass:
		func _init():
			super._init("CopyItemByIdOptions")

		var local_user_id: String
		var item_id: String

	class CopyItemImageInfoByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyItemImageInfoByIndexOptions")

		var local_user_id: String
		var item_id: String
		var image_info_index: int

	class CopyItemReleaseByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyItemReleaseByIndexOptions")

		var local_user_id: String
		var item_id: String
		var release_index: int

	class CopyOfferByIdOptions extends BaseClass:
		func _init():
			super._init("CopyOfferByIdOptions")

		var local_user_id: String
		var offer_id: String

	class CopyOfferByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyOfferByIndexOptions")

		var local_user_id: String
		var offer_index: int

	class CopyOfferImageInfoByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyOfferImageInfoByIndexOptions")

		var local_user_id: String
		var offer_id: String
		var image_info_index: int

	class CopyOfferItemByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyOfferItemByIndexOptions")

		var local_user_id: String
		var offer_id: String
		var item_index: int

	class CopyTransactionByIdOptions extends BaseClass:
		func _init():
			super._init("CopyTransactionByIdOptions")

		var local_user_id: String
		var transaction_id: String

	class CopyTransactionByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyTransactionByIndexOptions")

		var local_user_id: String
		var transaction_index: int

	class GetEntitlementsByNameCountOptions extends BaseClass:
		func _init():
			super._init("GetEntitlementsByNameCountOptions")

		var local_user_id: String
		var entitlement_name: String

	class GetEntitlementsCountOptions extends BaseClass:
		func _init():
			super._init("GetEntitlementsCountOptions")

		var local_user_id: String
		var item_id: String

	class GetItemImageInfoCountOptions extends BaseClass:
		func _init():
			super._init("GetItemImageInfoCountOptions")

		var local_user_id: String
		var item_id: String

	class GetItemReleaseCountOptions extends BaseClass:
		func _init():
			super._init("GetItemReleaseCountOptions")

		var local_user_id: String
		var item_id: String

	class GetOfferCountOptions extends BaseClass:
		func _init():
			super._init("GetOfferCountOptions")

		var local_user_id: String

	class GetOfferImageInfoCountOptions extends BaseClass:
		func _init():
			super._init("GetOfferImageInfoCountOptions")

		var local_user_id: String
		var offer_id: String

	class GetOfferItemCountOptions extends BaseClass:
		func _init():
			super._init("GetOfferItemCountOptions")

		var local_user_id: String
		var offer_id: String

	class GetTransactionCountOptions extends BaseClass:
		func _init():
			super._init("GetTransactionCountOptions")

		var local_user_id: String

	class QueryEntitlementsOptions extends BaseClass:
		func _init():
			super._init("QueryEntitlementsOptions")

		var local_user_id: String
		var entitlement_names: Array # [String]
		var include_redeemed: bool

	class QueryOffersOptions extends BaseClass:
		func _init():
			super._init("QueryOffersOptions")

		var local_user_id: String
		var override_catalog_namespace = null # String

		var client_data = null

	class QueryOwnershipOptions extends BaseClass:
		func _init():
			super._init("QueryOwnershipOptions")

		var local_user_id: String
		var catalog_item_ids: Array # [String]
		var catalog_namespace = null # String

		var client_data = null

	class QueryOwnershipTokenOptions extends BaseClass:
		func _init():
			super._init("QueryOwnershipTokenOptions")

		var local_user_id: String
		var catalog_item_ids: Array # [String]
		var catalog_namespace = null # String

		var client_data = null

	class RedeemEntitlementsOptions extends BaseClass:
		func _init():
			super._init("RedeemEntitlementsOptions")

		var local_user_id: String
		var entitlement_ids: Array # [String]

		var client_data = null

	class EcomInterface:
		static func checkout(options: CheckoutOptions) -> void:
			IEOS.ecom_interface_checkout(options)

		static func copy_entitlement_by_id(options: CopyEntitlementByIdOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_entitlement_by_id(options)

		static func copy_entitlement_by_index(options: CopyEntitlementByIndexOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_entitlement_by_index(options)

		static func copy_entitlement_by_name_and_index(options: CopyEntitlementByNameAndIndexOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_entitlement_by_name_and_index(options)

		static func copy_item_by_id(options: CopyItemByIdOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_item_by_id(options)

		static func copy_item_image_info_by_index(options: CopyItemImageInfoByIndexOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_item_image_info_by_index(options)

		static func copy_item_release_by_index(options: CopyItemReleaseByIndexOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_item_release_by_index(options)

		static func copy_offer_by_id(options: CopyOfferByIdOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_offer_by_id(options)

		static func copy_offer_by_index(options: CopyOfferByIndexOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_offer_by_index(options)

		static func copy_offer_image_info_by_index(options: CopyOfferImageInfoByIndexOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_offer_image_info_by_index(options)

		static func copy_offer_item_by_index(options: CopyOfferItemByIndexOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_offer_item_by_index(options)

		static func copy_transaction_by_id(options: CopyTransactionByIdOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_transaction_by_id(options)

		static func copy_transaction_by_index(options: CopyTransactionByIndexOptions) -> Dictionary:
			return IEOS.ecom_interface_copy_transaction_by_index(options)

		static func get_entitlements_by_name_count(options: GetEntitlementsByNameCountOptions) -> int:
			return IEOS.ecom_interface_get_entitlements_by_name_count(options)

		static func get_entitlements_count(options: GetEntitlementsCountOptions) -> int:
			return IEOS.ecom_interface_get_entitlements_count(options)

		static func get_item_image_info_count(options: GetItemImageInfoCountOptions) -> int:
			return IEOS.ecom_interface_get_item_image_info_count(options)

		static func get_item_release_count(options: GetItemReleaseCountOptions) -> int:
			return IEOS.ecom_interface_get_item_release_count(options)

		static func get_offer_count(options: GetOfferCountOptions) -> int:
			return IEOS.ecom_interface_get_offer_count(options)

		static func get_offer_image_info_count(options: GetOfferImageInfoCountOptions) -> int:
			return IEOS.ecom_interface_get_offer_image_info_count(options)

		static func get_offer_item_count(options: GetOfferItemCountOptions) -> int:
			return IEOS.ecom_interface_get_offer_item_count(options)

		static func get_transaction_count(options: GetTransactionCountOptions) -> int:
			return IEOS.ecom_interface_get_transaction_count(options)

		static func query_entitlements(options: QueryEntitlementsOptions) -> void:
			IEOS.ecom_interface_query_entitlements(options)

		static func query_offers(options: QueryOffersOptions) -> void:
			IEOS.ecom_interface_query_offers(options)

		static func query_ownership(options: QueryOwnershipOptions) -> void:
			IEOS.ecom_interface_query_ownership(options)

		static func query_ownership_token(options: QueryOwnershipTokenOptions) -> void:
			IEOS.ecom_interface_query_ownership_token(options)

		static func redeem_entitlements(options: RedeemEntitlementsOptions) -> void:
			IEOS.ecom_interface_redeem_entitlements(options)


class Friends:
	enum FriendsStatus { NotFriends = 0, InviteSent = 1, InviteReceived = 2, Friends = 3 }

	class AcceptInviteOptions extends BaseClass:
		func _init():
			super._init("AcceptInviteOptions")

		var local_user_id: String
		var target_user_id: String

		var client_data = null

	class GetFriendAtIndexOptions extends BaseClass:
		func _init():
			super._init("GetFriendAtIndexOptions")

		var local_user_id: String
		var index: int

	class GetFriendsCountOptions extends BaseClass:
		func _init():
			super._init("GetFriendsCountOptions")

		var local_user_id: String

	class GetStatusOptions extends BaseClass:
		func _init():
			super._init("GetStatusOptions")

		var local_user_id: String
		var target_user_id: String

	class QueryFriendsOptions extends BaseClass:
		func _init():
			super._init("QueryFriendsOptions")

		var local_user_id: String

	class RejectInviteOptions extends BaseClass:
		func _init():
			super._init("RejectInviteOptions")

		var local_user_id: String
		var target_user_id: String

	class FriendsInterface:
		static func accept_invite(options: AcceptInviteOptions) -> void:
			IEOS.friends_interface_accept_invite(options)

		static func get_friend_at_index(options: GetFriendAtIndexOptions) -> String:
			return IEOS.friends_interface_get_friend_at_index(options)

		static func get_friends_count(options: GetFriendsCountOptions) -> int:
			return IEOS.friends_interface_get_friends_count(options)

		static func get_status(options: GetStatusOptions) -> int:
			return IEOS.friends_interface_get_status(options)

		static func query_friends(options: QueryFriendsOptions) -> void:
			IEOS.friends_interface_query_friends(options)

		static func reject_invite(options: RejectInviteOptions) -> void:
			IEOS.friends_interface_reject_invite(options)


class KWS:
	enum KWSPermissionStatus { Granted = 0, Rejected = 1, Pending = 2 }

	class CopyPermissionByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyPermissionByIndexOptions")

		var local_user_id: String
		var index: int

	class CreateUserOptions extends BaseClass:
		func _init():
			super._init("CreateUserOptions")

		var local_user_id: String
		var date_of_birth: String # Date of birth in ISO8601 form (YYYY-MM-DD)
		var parent_email: String

	class GetPermissionByKeyOptions extends BaseClass:
		func _init():
			super._init("GetPermissionByKeyOptions")

		var local_user_id: String
		var key: String

	class GetPermissionsCountOptions extends BaseClass:
		func _init():
			super._init("GetPermissionsCountOptions")

		var local_user_id: String

	class QueryAgeGateOptions extends BaseClass:
		func _init():
			super._init("QueryAgeGateOptions")

	class QueryPermissionsOptions extends BaseClass:
		func _init():
			super._init("QueryPermissionsOptions")

		var local_user_id: String

	class RequestPermissionsOptions extends BaseClass:
		func _init():
			super._init("RequestPermissionsOptions")

		var local_user_id: String
		var permission_keys: Array # [String]

	class UpdateParentEmailOptions extends BaseClass:
		func _init():
			super._init("UpdateParentEmailOptions")

		var local_user_id: String
		var parent_email: String

	static func copy_permission_by_index(options: CopyPermissionByIndexOptions) -> Dictionary:
		return IEOS.kws_interface_copy_permission_by_index(options)

	static func create_user(options: CreateUserOptions) -> void:
		IEOS.kws_interface_create_user(options)

	static func get_permission_by_key(options: GetPermissionByKeyOptions) -> Dictionary:
		return IEOS.kws_interface_get_permission_by_key(options)

	static func get_permissions_count(options: GetPermissionsCountOptions) -> int:
		return IEOS.kws_interface_get_permissions_count(options)

	static func query_age_gate(options: QueryAgeGateOptions) -> void:
		IEOS.kws_interface_query_age_gate(options)

	static func query_permissions(options: QueryPermissionsOptions) -> void:
		IEOS.kws_interface_query_permissions(options)

	static func request_permissions(options: RequestPermissionsOptions) -> void:
		IEOS.kws_interface_request_permissions(options)

	static func update_parent_email(options: UpdateParentEmailOptions) -> void:
		IEOS.kws_interface_update_parent_email(options)


class Leaderboards:
	enum LeaderboardAggregation { Min = 0, Max = 1, Sum = 2, Latest = 3 }

	class CopyLeaderboardDefinitionByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyLeaderboardDefinitionByIndexOptions")

		var leaderboard_index: int

	class CopyLeaderboardDefinitionByLeaderboardId extends BaseClass:
		func _init():
			super._init("CopyLeaderboardDefinitionByLeaderboardId")

		var leaderboard_id: String

	class CopyLeaderboardRecordByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyLeaderboardRecordByIndexOptions")

		var leaderboard_record_index: int

	class CopyLeaderboardRecordByUserIdOptions extends BaseClass:
		func _init():
			super._init("CopyLeaderboardRecordByUserIdOptions")

		var user_id: int

	class CopyLeaderboardUserScoreByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyLeaderboardUserScoreByIndexOptions")

		var leaderboard_user_score_index: int
		var stat_name: String

	class CopyLeaderboardUserScoreByUserIdOptions extends BaseClass:
		func _init():
			super._init("CopyLeaderboardUserScoreByUserIdOptions")

		var user_id: String
		var stat_name: String

	class GetLeaderboardDefinitionCountOptions extends BaseClass:
		func _init():
			super._init("GetLeaderboardDefinitionCountOptions")

	class GetLeaderboardRecordCountOptions extends BaseClass:
		func _init():
			super._init("GetLeaderboardRecordCountOptions")

	class GetLeaderboardUserScoreCountOptions extends BaseClass:
		func _init():
			super._init("GetLeaderboardUserScoreCountOptions")

		var stat_name: String

	class QueryLeaderboardDefinitionsOptions extends BaseClass:
		func _init():
			super._init("QueryLeaderboardDefinitionsOptions")

		var local_user_id: String
		var start_time = null # String
		var end_time = null # String

		var client_data = null

	class QueryLeaderboardRanksOptions extends BaseClass:
		func _init():
			super._init("QueryLeaderboardRanksOptions")

		var local_user_id: String
		var leaderboard_id: String

		var client_data = null

	class QueryLeaderboardUserScoresOptions extends BaseClass:
		func _init():
			super._init("QueryLeaderboardUserScoresOptions")

		var local_user_id: String
		var user_ids = [] # [String]
		var stat_info = [] # [{stat_name: String, aggregation: LeaderboardAggregation}]
		var start_time = null # String
		var end_time = null # String

		var client_data = null

	class LeaderboardsInterface:
		static func copy_leaderboard_definition_by_index(options: CopyLeaderboardDefinitionByIndexOptions) -> Dictionary:
			return IEOS.leaderboards_interface_copy_leaderboard_definition_by_index(options)

		static func copy_leaderboard_definition_by_leaderboard_id(options: CopyLeaderboardDefinitionByLeaderboardId) -> Dictionary:
			return IEOS.leaderboards_interface_copy_leaderboard_definition_by_leaderboard_id(options)

		static func copy_leaderboard_record_by_index(options: CopyLeaderboardRecordByIndexOptions) -> Dictionary:
			return IEOS.leaderboards_interface_copy_leaderboard_record_by_index(options)

		static func copy_leaderboard_record_by_user_id(options: CopyLeaderboardRecordByUserIdOptions) -> Dictionary:
			return IEOS.leaderboards_interface_copy_leaderboard_record_by_user_id(options)

		static func copy_leaderboard_user_score_by_index(options: CopyLeaderboardUserScoreByIndexOptions) -> Dictionary:
			return IEOS.leaderboards_interface_copy_leaderboard_user_score_by_index(options)

		static func copy_leaderboard_user_score_by_user_id(options: CopyLeaderboardUserScoreByUserIdOptions) -> Dictionary:
			return IEOS.leaderboards_interface_copy_leaderboard_user_score_by_user_id(options)

		static func get_leaderboard_definition_count(options: GetLeaderboardDefinitionCountOptions) -> int:
			return IEOS.leaderboards_interface_get_leaderboard_definition_count(options)

		static func get_leaderboard_record_count(options: GetLeaderboardRecordCountOptions) -> int:
			return IEOS.leaderboards_interface_get_leaderboard_record_count(options)

		static func get_leaderboard_user_score_count(options: GetLeaderboardUserScoreCountOptions) -> int:
			return IEOS.leaderboards_interface_get_leaderboard_user_score_count(options)

		static func query_leaderboard_definitions(options: QueryLeaderboardDefinitionsOptions) -> void:
			IEOS.leaderboards_interface_query_leaderboard_definitions(options)

		static func query_leaderboard_ranks(options: QueryLeaderboardRanksOptions) -> void:
			IEOS.leaderboards_interface_query_leaderboard_ranks(options)

		static func query_leaderboard_user_scores(options: QueryLeaderboardUserScoresOptions) -> void:
			IEOS.leaderboards_interface_query_leaderboard_user_scores(options)


class Lobby:
	enum LobbyAttributeVisibility { Public = 0, Private = 1 }

	enum LobbyMemberStatus {
		Joined = 0,
		Left = 1,
		Disconnected = 2,
		Kicked = 3,
		Promoted = 4,
		Closed = 5
	}

	enum LobbyPermissionLevel { Publicadvertised = 0, Joinviapresence = 1, Inviteonly = 2 }


class Metrics:
	enum MetricsAccountIdType { Epic = 0, External = 1 }

	enum UserControllerType { Unknown = 0, MouseKeyboard = 1, GamepadControl = 2, TouchControl = 3 }

	class BeginPlayerSessionOptions extends BaseClass:
		func _init():
			super._init("BeginPlayerSessionOptions")

		var account_id_type: int # MetricsAccountIdType
		var account_id: String
		var display_name: String
		var controller_type: int # UserControllerType
		var server_ip = null # String
		var game_session_id = null # String

	class EndPlayerSessionOptions extends BaseClass:
		func _init():
			super._init("EndPlayerSessionOptions")

		var account_id_type: int # MetricsAccountIdType
		var account_id: String

	class MetricsInterface:
		static func begin_player_session(options: BeginPlayerSessionOptions) -> int:
			return IEOS.metrics_interface_begin_player_session(options)

		static func end_player_session(options: EndPlayerSessionOptions) -> int:
			return IEOS.metrics_interface_end_player_session(options)


class Mods:
	enum ModEnumerationType { Installed = 0, AllAvailable }

	class CopyModInfoOptions extends BaseClass:
		func _init():
			super._init("CopyModInfoOptions")

		var local_user_id: String
		var type: int # ModEnumerationType

	class EnumerateModsOptions extends BaseClass:
		func _init():
			super._init("EnumerateModsOptions")

		var local_user_id: String
		var type: int # ModEnumerationType

	class ModsInterface:
		static func copy_mod_info(options: CopyModInfoOptions) -> Dictionary:
			return IEOS.mods_interface_copy_mod_info(options)

		static func enumerate_mods(options: EnumerateModsOptions) -> void:
			IEOS.mods_interface_enumerate_mods(options)


class P2P:
	enum ConnectionClosedReason {
		Unknown = 0,
		ClosedByLocalUser = 1,
		ClosedByPeer = 2,
		TimedOut = 3,
		TooManyConnections = 4,
		InvalidMessage = 5,
		InvalidData = 6,
		ConnectionFailed = 7,
		ConnectionClosed = 8,
		NegotiationFailed = 9,
		UnexpectedError = 10
	}

	enum ConnectionEstablishedType { NewConnection = 0, Reconnection = 1 }

	enum NATType { Unknown = 0, Open = 1, Moderate = 2, Strict = 3 }

	enum PacketReliability { UnreliableUnordered = 0, ReliableUnordered = 1, ReliableOrdered = 2 }

	enum RelayControl { NoRelays = 0, AllowRelays = 1, ForceRelays = 2 }


class PlayerDataStorage:
	enum ReadResult { ContinueReading = 1, FailRequest = 2, CancelRequest = 3 }

	enum WriteResult {
		ContinueWriting = 1,
		CompleteRequest = 2,
		FailRequest = 3,
		CancelRequest = 4
	}


class Presence:
	enum Status { Offline = 0, Online = 1, Away = 2, ExtendedAway = 3, DoNotDisturb = 4 }

	class CopyPresenceOptions extends BaseClass:
		func _init():
			super._init("CopyPresenceOptions")

		var local_user_id: String
		var target_user_id: String

	class CreatePresenceModificationOptions extends BaseClass:
		func _init():
			super._init("CopyPresenceOptions")

		var local_user_id: String

	class PresenceModificationSetDataOptions extends BaseClass:
		func _init():
			super._init("PresenceModificationSetDataOptions")

		var records: Array # [{key: string, value: string}]

	class PresenceModificationDeleteDataOptions extends BaseClass:
		func _init():
			super._init("PresenceModificationDeleteDataOptions")

		var records: Array # [string]

	class PresenceModificationSetJoinInfoOptions extends BaseClass:
		func _init():
			super._init("PresenceModificationSetJoinInfoOptions")

		var join_info: String

	class PresenceModificationSetRawRichTextOptions extends BaseClass:
		func _init():
			super._init("PresenceModificationSetRawRichTextOptions")

		var rich_text: String

	class PresenceModificationSetStatusOptions extends BaseClass:
		func _init():
			super._init("PresenceModificationSetStatusOptions")

		var status: int

	class GetJoinInfoOptions extends BaseClass:
		func _init():
			super._init("GetJoinInfoOptions")

		var local_user_id: String
		var target_user_id: String

	class HasPresenceOptions extends BaseClass:
		func _init():
			super._init("HasPresenceOptions")

		var local_user_id: String
		var target_user_id: String

	class QueryPresenceOptions extends BaseClass:
		func _init():
			super._init("QueryPresenceOptions")

		var local_user_id: String
		var target_user_id: String

		var client_data = null

	class SetPresenceOptions extends BaseClass:
		func _init():
			super._init("SetPresenceOptions")

		var local_user_id: String
		var presence_modification: RefCounted # PresenceModificationWrapper

		var client_data = null


	class PresenceInterface:
		static func copy_presence(options: CopyPresenceOptions) -> Dictionary:
			return IEOS.presence_interface_copy_presence(options)

		static func create_presence_modification(options: CreatePresenceModificationOptions) -> Dictionary:
			return IEOS.presence_interface_create_presence_modification(options)

		static func get_join_info(options: GetJoinInfoOptions) -> Dictionary:
			return IEOS.presence_interface_get_join_info(options)

		static func has_presence(options: HasPresenceOptions) -> bool:
			return IEOS.presence_interface_has_presence(options)

		static func query_presence(options: QueryPresenceOptions) -> void:
			IEOS.presence_interface_query_presence(options)

		static func set_presence(options: SetPresenceOptions) -> void:
			IEOS.presence_interface_set_presence(options)

class Reports:
	enum PlayerReportsCategory {
		Invalid = 0,
		Cheating = 1,
		Exploiting = 2,
		OffensiveProfile = 3,
		VerbalAbuse = 4,
		Scamming = 5,
		Spamming = 6,
		Other = 7
	}

	class SendPlayerBehaviorReportOptions extends BaseClass:
		func _init():
			super._init("SendPlayerBehaviorReportOptions")

		var reporter_user_id: String
		var reported_user_id: String
		var category: int # PlayerReportsCategory
		var message: String
		var context: String

		var client_data = null

	class ReportsInterface:
		static func send_player_behavior_report(options: SendPlayerBehaviorReportOptions) -> void:
			IEOS.reports_interface_send_player_behavior_report(options)


class ProgressionSnapshot:

	class BeginSnapshotOptions extends BaseClass:
		func _init():
			super._init("BeginSnapshotOptions")

		var local_user_id: String

	class AddProgressionOptions extends BaseClass:
		func _init():
			super._init("AddProgressionOptions")

		var snapshot_id: int
		var key: String
		var value: String

	class SubmitSnapshotOptions extends BaseClass:
		func _init():
			super._init("SubmitSnapshotOptions")

		var snapshot_id: int

		var client_data = null

	class DeleteSnapshotOptions extends BaseClass:
		func _init():
			super._init("DeleteSnapshotOptions")

		var local_user_id: String

		var client_data = null

	class ProgressionSnapshotInterface:
		static func begin_snapshot(options: BeginSnapshotOptions) -> Dictionary:
			return IEOS.progression_snapshot_interface_begin_snapshot(options)

		static func add_progression(options: AddProgressionOptions) -> int:
			return IEOS.progression_snapshot_interface_add_progression(options)

		static func submit_snapshot(options: SubmitSnapshotOptions) -> void:
			IEOS.progression_snapshot_interface_submit_snapshot(options)

		static func delete_snapshot(options: DeleteSnapshotOptions) -> void:
			IEOS.progression_snapshot_interface_delete_snapshot(options)


class RTC:
	enum RTCParticipantStatus { Joined = 0, Left = 1 }


class Sessions:
	enum OnlineSessionPermissionLevel { PublicAdvertised = 0, JoinViaPresence = 1, InviteOnly = 2 }

	enum OnlineSessionState {
		NoSession = 0,
		Creating = 1,
		Pending = 2,
		Starting = 3,
		InProgress = 4,
		Ending = 5,
		Ended = 6,
		Destroying = 7
	}
	enum SessionAttributeAdvertisementType { DontAdvertise = 0, Advertise = 1 }


class TitleStorage:
	enum ReadResult { RrContinuereading = 1, RrFailrequest = 2, RrCancelrequest = 3 }


class UI:
	const ModifierShift = 16
	const KeyTypeMask = (1 << ModifierShift) - 1
	const ModifierMask = ~KeyTypeMask
	const Shift = 1 << ModifierShift
	const Control_ = 2 << ModifierShift
	const Alt = 4 << ModifierShift
	const Meta = 8 << ModifierShift
	const ValidModifierMask = Shift | Control_ | Alt | Meta

	enum NotificationLocation { TopLeft, TopRight, BottomLeft, BottomRight }

	enum KeyCombination {
		ModifierShift = 16,
		KeyTypeMask = (1 << ModifierShift) - 1,
		ModifierMask = ~KeyTypeMask,
		Shift = 1 << ModifierShift,
		Control_ = 2 << ModifierShift,
		Alt = 4 << ModifierShift,
		Meta = 8 << ModifierShift,
		ValidModifierMask = Shift | Control_ | Alt | Meta,
		None = 0,
		Space,
		Backspace,
		Tab,
		Escape,
		PageUp,
		PageDown,
		End,
		Home,
		Insert,
		Delete,
		Left,
		Up,
		Right,
		Down,
		Key0,
		Key1,
		Key2,
		Key3,
		Key4,
		Key5,
		Key6,
		Key7,
		Key8,
		Key9,
		KeyA,
		KeyB,
		KeyC,
		KeyD,
		KeyE,
		KeyF,
		KeyG,
		KeyH,
		KeyI,
		KeyJ,
		KeyK,
		KeyL,
		KeyM,
		KeyN,
		KeyO,
		KeyP,
		KeyQ,
		KeyR,
		KeyS,
		KeyT,
		KeyU,
		KeyV,
		KeyW,
		KeyX,
		KeyY,
		KeyZ,
		Numpad0,
		Numpad1,
		Numpad2,
		Numpad3,
		Numpad4,
		Numpad5,
		Numpad6,
		Numpad7,
		Numpad8,
		Numpad9,
		NumpadAsterisk,
		NumpadPlus,
		NumpadMinus,
		NumpadPeriod,
		NumpadDivide,
		F1,
		F2,
		F3,
		F4,
		F5,
		F6,
		F7,
		F8,
		F9,
		F10,
		F11,
		F12,
		F13,
		F14,
		F15,
		F16,
		F17,
		F18,
		F19,
		F20,
		F21,
		F22,
		F23,
		F24,
		OemPlus,
		OemComma,
		OemMinus,
		OemPeriod,
		Oem1,
		Oem2,
		Oem3,
		Oem4,
		Oem5,
		Oem6,
		Oem7,
		Oem8,
		MaxKeyType
	}

	class AcknowledgeEventIdOptions extends BaseClass:
		func _init():
			super._init("AcknowledgeEventIdOptions")

		var ui_event_id: int
		var result: int

	class GetFriendsVisibleOptions extends BaseClass:
		func _init():
			super._init("GetFriendsVisibleOptions")

		var local_user_id: String

	class GetToggleFriendsKeyOptions extends BaseClass:
		func _init():
			super._init("GetToggleFriendsKeyOptions")

	class HideFriendsOptions extends BaseClass:
		func _init():
			super._init("HideFriendsOptions")

		var local_user_id: String

		var client_data = null

	class SetDisplayPreferenceOptions extends BaseClass:
		func _init():
			super._init("SetDisplayPreferenceOptions")

		var notification_location: int # NotificationLocation

	class SetToggleFriendsKeyOptions extends BaseClass:
		func _init():
			super._init("SetToggleFriendsKeyOptions")

		var key_combination: int # KeyCombination

	class ShowFriendsOptions extends BaseClass:
		func _init():
			super._init("ShowFriendsOptions")

		var local_user_id: String

		var client_data = null

	class UIInterface:
		static func acknowledge_event_id(options: AcknowledgeEventIdOptions) -> int:
			return IEOS.ui_interface_acknowledge_event_id(options)

		static func get_friends_visible(options: GetFriendsVisibleOptions) -> bool:
			return IEOS.ui_interface_get_friends_visible(options)

		static func get_notification_location_preference() -> int:
			return IEOS.ui_interface_get_notification_location_preference()

		static func get_toggle_friends_key(options: GetToggleFriendsKeyOptions) -> int:
			return IEOS.ui_interface_get_toggle_friends_key(options)

		static func hide_friends(options: HideFriendsOptions) -> void:
			IEOS.ui_interface_hide_friends(options)

		static func is_valid_key_combination(key_combination: int) -> bool:
			return IEOS.ui_interface_is_valid_key_combination(key_combination)

		static func set_display_preference(options: SetDisplayPreferenceOptions) -> int:
			return IEOS.ui_interface_set_display_preference(options)

		static func set_toggle_friends_key(options: SetToggleFriendsKeyOptions) -> int:
			return IEOS.ui_interface_set_toggle_friends_key(options)

		static func show_friends(options: ShowFriendsOptions) -> void:
			IEOS.ui_interface_show_friends(options)


class UserInfo:

	class CopyExternalUserInfoByAccountIdOptions extends BaseClass:
		func _init():
			super._init("CopyExternalUserInfoByAccountIdOptions")

		var local_user_id: String
		var target_user_id: String
		var account_id: String

	class CopyExternalUserInfoByAccountTypeOptions extends BaseClass:
		func _init():
			super._init("CopyExternalUserInfoByAccountTypeOptions")

		var local_user_id: String
		var target_user_id: String
		var account_type: int # ExternalAccountType

	class CopyExternalUserInfoByIndexOptions extends BaseClass:
		func _init():
			super._init("CopyExternalUserInfoByIndexOptions")

		var local_user_id: String
		var target_user_id: String
		var index: int

	class CopyUserInfoOptions extends BaseClass:
		func _init():
			super._init("CopyUserInfoOptions")

		var local_user_id: String
		var target_user_id: String

	class GetExternalUserInfoCountOptions extends BaseClass:
		func _init():
			super._init("GetExternalUserInfoCountOptions")

		var local_user_id: String
		var target_user_id: String

	class QueryUserInfoOptions extends BaseClass:
		func _init():
			super._init("QueryUserInfoOptions")

		var local_user_id: String
		var target_user_id: String

		var client_data = null

	class QueryUserInfoByDisplayNameOptions extends BaseClass:
		func _init():
			super._init("QueryUserInfoByDisplayNameOptions")

		var local_user_id: String
		var display_name: String

		var client_data = null

	class QueryUserInfoByExternalAccountOptions extends BaseClass:
		func _init():
			super._init("QueryUserInfoByExternalAccountOptions")

		var local_user_id: String
		var external_account_id: String
		var account_type: int # ExternalAccountType

		var client_data = null

	class UserInfoInterface:
		static func copy_external_user_info_by_account_id(options: CopyExternalUserInfoByAccountIdOptions) -> Dictionary:
			return IEOS.user_info_interface_copy_external_user_info_by_account_id(options)

		static func copy_external_user_info_by_account_type(options: CopyExternalUserInfoByAccountTypeOptions) -> Dictionary:
			return IEOS.user_info_interface_copy_external_user_info_by_account_type(options)

		static func copy_external_user_info_by_index(options: CopyExternalUserInfoByIndexOptions) -> Dictionary:
			return IEOS.user_info_interface_copy_external_user_info_by_index(options)

		static func copy_user_info(options: CopyUserInfoOptions) -> Dictionary:
			return IEOS.user_info_interface_copy_user_info(options)

		static func get_external_user_info_count(options: GetExternalUserInfoCountOptions) -> int:
			return IEOS.user_info_interface_get_external_user_info_count(options)

		static func query_user_info(options: QueryUserInfoOptions) -> void:
			IEOS.user_info_interface_query_user_info(options)

		static func query_user_info_by_display_name(options: QueryUserInfoByDisplayNameOptions) -> void:
			IEOS.user_info_interface_query_user_info_by_display_name(options)

		static func query_user_info_by_external_account(options: QueryUserInfoByExternalAccountOptions) -> void:
			IEOS.user_info_interface_query_user_info_by_external_account(options)


class Logging:
	enum LogCategory {
		Core = 0,
		Auth = 1,
		Friends = 2,
		Presence = 3,
		UserInfo = 4,
		HttpSerialization = 5,
		Ecom = 6,
		P2P = 7,
		Sessions = 8,
		RateLimiter = 9,
		PlayerDataStorage = 10,
		Analytics = 11,
		Messaging = 12,
		Connect = 13,
		Overlay = 14,
		Achievements = 15,
		Stats = 16,
		Ui = 17,
		Lobby = 18,
		Leaderboards = 19,
		Keychain = 20,
		IntegratedPlatform = 21,
		TitleStorage = 22,
		Mods = 23,
		AntiCheat = 24,
		Reports = 25,
		Sanctions = 26,
		ProgressionSnapshots = 27,
		Kws = 28,
		Rtc = 29,
		RTCAdmin = 30,
		CustomInvites = 31,
		AllCategories = 0x7fffffff
	}

	enum LogLevel {
		Off = 0,
		Fatal = 100,
		Error = 200,
		Warning = 300,
		Info = 400,
		Verbose = 500,
		VeryVerbose = 600
	}

	class LogMessage extends BaseClass:
		func _init():
			super._init("LogMessage")

		var category: String
		var level: int  # LogLevel enum
		var message: String

		static func from(msg_dict: Dictionary) -> LogMessage:
			var msg = LogMessage.new()
			msg.category = msg_dict.get("category")
			msg.level = msg_dict.get("level")
			msg.message = msg_dict.get("message")
			return msg

		func _to_string() -> String:
			return "%s | %s | %s" % [category, level, message]

	static func set_log_level(log_category: int, log_level: int) -> int:
		return 1#IEOS.logging_interface_set_log_level(log_category, log_level)


class Version:
	class VersionInterface:
		static func get_version() -> String:
			return IEOS.version_interface_get_version()

		static func get_constants() -> Dictionary:
			return IEOS.version_interface_get_constants()


static func print_result(p_result: int) -> void:
	print_rich("[b]EOS_Result[/b]:%s[code](%s)[/code]" % [result_str(p_result), p_result])


static func result_str(p_result) -> String:
	if typeof(p_result) == TYPE_DICTIONARY:
		p_result = p_result["result_code"]
	var idx := Result.values().find(p_result)
	return Result.keys()[idx]


enum Result {
	Success = 0,
	NoConnection = 1,
	InvalidCredentials = 2,
	InvalidUser = 3,
	InvalidAuth = 4,
	AccessDenied = 5,
	MissingPermissions = 6,
	TokenNotAccount = 7,
	TooManyRequests = 8,
	AlreadyPending = 9,
	InvalidParameters = 10,
	InvalidRequest = 11,
	UnrecognizedResponse = 12,
	IncompatibleVersion = 13,
	NotConfigured = 14,
	AlreadyConfigured = 15,
	NotImplemented = 16,
	Canceled = 17,
	NotFound = 18,
	OperationWillRetry = 19,
	NoChange = 20,
	VersionMismatch = 21,
	LimitExceeded = 22,
	Disabled = 23,
	DuplicateNotAllowed = 24,
	MissingParametersDEPRECATED = 25,
	InvalidSandboxId = 26,
	TimedOut = 27,
	PartialResult = 28,
	MissingRole = 29,
	MissingFeature = 30,
	InvalidSandbox = 31,
	InvalidDeployment = 32,
	InvalidProduct = 33,
	InvalidProductUserID = 34,
	ServiceFailure = 35,
	CacheDirectoryMissing = 36,
	CacheDirectoryInvalid = 37,
	InvalidState = 38,
	RequestInProgress = 39,
	ApplicationSuspended = 40,
	NetworkDisconnected = 41,
	AuthAccountLocked = 1001,
	AuthAccountLockedForUpdate = 1002,
	AuthInvalidRefreshToken = 1003,
	AuthInvalidToken = 1004,
	AuthAuthenticationFailure = 1005,
	AuthInvalidPlatformToken = 1006,
	AuthWrongAccount = 1007,
	AuthWrongClient = 1008,
	AuthFullAccountRequired = 1009,
	AuthHeadlessAccountRequired = 1010,
	AuthPasswordResetRequired = 1011,
	AuthPasswordCannotBeReused = 1012,
	AuthExpired = 1013,
	AuthScopeConsentRequired = 1014,
	AuthApplicationNotFound = 1015,
	AuthScopeNotFound = 1016,
	AuthAccountFeatureRestricted = 1017,
	AuthAccountPortalLoadError = 1018,
	AuthCorrectiveActionRequired = 1019,
	AuthPinGrantCode = 1020,
	AuthPinGrantExpired = 1021,
	AuthPinGrantPending = 1022,
	AuthExternalAuthNotLinked = 1030,
	AuthExternalAuthRevoked = 1032,
	AuthExternalAuthInvalid = 1033,
	AuthExternalAuthRestricted = 1034,
	AuthExternalAuthCannotLogin = 1035,
	AuthExternalAuthExpired = 1036,
	AuthExternalAuthIsLastLoginType = 1037,
	AuthExchangeCodeNotFound = 1040,
	AuthOriginatingExchangeCodeSessionExpired = 1041,
	AuthAccountNotActive = 1050,
	AuthMFARequired = 1060,
	AuthParentalControls = 1070,
	AuthNoRealId = 1080,
	FriendsInviteAwaitingAcceptance = 2000,
	FriendsNoInvitation = 2001,
	FriendsAlreadyFriends = 2003,
	FriendsNotFriends = 2004,
	FriendsTargetUserTooManyInvites = 2005,
	FriendsLocalUserTooManyInvites = 2006,
	FriendsTargetUserFriendLimitExceeded = 2007,
	FriendsLocalUserFriendLimitExceeded = 2008,
	PresenceDataInvalid = 3000,
	PresenceDataLengthInvalid = 3001,
	PresenceDataKeyInvalid = 3002,
	PresenceDataKeyLengthInvalid = 3003,
	PresenceDataValueInvalid = 3004,
	PresenceDataValueLengthInvalid = 3005,
	PresenceRichTextInvalid = 3006,
	PresenceRichTextLengthInvalid = 3007,
	PresenceStatusInvalid = 3008,
	EcomEntitlementStale = 4000,
	EcomCatalogOfferStale = 4001,
	EcomCatalogItemStale = 4002,
	EcomCatalogOfferPriceInvalid = 4003,
	EcomCheckoutLoadError = 4004,
	SessionsSessionInProgress = 5000,
	SessionsTooManyPlayers = 5001,
	SessionsNoPermission = 5002,
	SessionsSessionAlreadyExists = 5003,
	SessionsInvalidLock = 5004,
	SessionsInvalidSession = 5005,
	SessionsSandboxNotAllowed = 5006,
	SessionsInviteFailed = 5007,
	SessionsInviteNotFound = 5008,
	SessionsUpsertNotAllowed = 5009,
	SessionsAggregationFailed = 5010,
	SessionsHostAtCapacity = 5011,
	SessionsSandboxAtCapacity = 5012,
	SessionsSessionNotAnonymous = 5013,
	SessionsOutOfSync = 5014,
	SessionsTooManyInvites = 5015,
	SessionsPresenceSessionExists = 5016,
	SessionsDeploymentAtCapacity = 5017,
	SessionsNotAllowed = 5018,
	SessionsPlayerSanctioned = 5019,
	PlayerDataStorageFilenameInvalid = 6000,
	PlayerDataStorageFilenameLengthInvalid = 6001,
	PlayerDataStorageFilenameInvalidChars = 6002,
	PlayerDataStorageFileSizeTooLarge = 6003,
	PlayerDataStorageFileSizeInvalid = 6004,
	PlayerDataStorageFileHandleInvalid = 6005,
	PlayerDataStorageDataInvalid = 6006,
	PlayerDataStorageDataLengthInvalid = 6007,
	PlayerDataStorageStartIndexInvalid = 6008,
	PlayerDataStorageRequestInProgress = 6009,
	PlayerDataStorageUserThrottled = 6010,
	PlayerDataStorageEncryptionKeyNotSet = 6011,
	PlayerDataStorageUserErrorFromDataCallback = 6012,
	PlayerDataStorageFileHeaderHasNewerVersion = 6013,
	PlayerDataStorageFileCorrupted = 6014,
	ConnectExternalTokenValidationFailed = 7000,
	ConnectUserAlreadyExists = 7001,
	ConnectAuthExpired = 7002,
	ConnectInvalidToken = 7003,
	ConnectUnsupportedTokenType = 7004,
	ConnectLinkAccountFailed = 7005,
	ConnectExternalServiceUnavailable = 7006,
	ConnectExternalServiceConfigurationFailure = 7007,
	ConnectLinkAccountFailedMissingNintendoIdAccountDEPRECATED = 7008,
	SocialOverlayLoadError = 8000,
	LobbyNotOwner = 9000,
	LobbyInvalidLock = 9001,
	LobbyLobbyAlreadyExists = 9002,
	LobbySessionInProgress = 9003,
	LobbyTooManyPlayers = 9004,
	LobbyNoPermission = 9005,
	LobbyInvalidSession = 9006,
	LobbySandboxNotAllowed = 9007,
	LobbyInviteFailed = 9008,
	LobbyInviteNotFound = 9009,
	LobbyUpsertNotAllowed = 9010,
	LobbyAggregationFailed = 9011,
	LobbyHostAtCapacity = 9012,
	LobbySandboxAtCapacity = 9013,
	LobbyTooManyInvites = 9014,
	LobbyDeploymentAtCapacity = 9015,
	LobbyNotAllowed = 9016,
	LobbyMemberUpdateOnly = 9017,
	LobbyPresenceLobbyExists = 9018,
	LobbyVoiceNotEnabled = 9019,
	TitleStorageUserErrorFromDataCallback = 10000,
	TitleStorageEncryptionKeyNotSet = 10001,
	TitleStorageFileCorrupted = 10002,
	TitleStorageFileHeaderHasNewerVersion = 10003,
	ModsModSdkProcessIsAlreadyRunning = 11000,
	ModsModSdkCommandIsEmpty = 11001,
	ModsModSdkProcessCreationFailed = 11002,
	ModsCriticalError = 11003,
	ModsToolInternalError = 11004,
	ModsIPCFailure = 11005,
	ModsInvalidIPCResponse = 11006,
	ModsURILaunchFailure = 11007,
	ModsModIsNotInstalled = 11008,
	ModsUserDoesNotOwnTheGame = 11009,
	ModsOfferRequestByIdInvalidResult = 11010,
	ModsCouldNotFindOffer = 11011,
	ModsOfferRequestByIdFailure = 11012,
	ModsPurchaseFailure = 11013,
	ModsInvalidGameInstallInfo = 11014,
	ModsCannotGetManifestLocation = 11015,
	ModsUnsupportedOS = 11016,
	AntiCheatClientProtectionNotAvailable = 12000,
	AntiCheatInvalidMode = 12001,
	AntiCheatClientProductIdMismatch = 12002,
	AntiCheatClientSandboxIdMismatch = 12003,
	AntiCheatProtectMessageSessionKeyRequired = 12004,
	AntiCheatProtectMessageValidationFailed = 12005,
	AntiCheatProtectMessageInitializationFailed = 12006,
	AntiCheatPeerAlreadyRegistered = 12007,
	AntiCheatPeerNotFound = 12008,
	AntiCheatPeerNotProtected = 12009,
	AntiCheatClientDeploymentIdMismatch = 12010,
	AntiCheatDeviceIdAuthIsNotSupported = 12011,
	TooManyParticipants = 13000,
	RoomAlreadyExists = 13001,
	UserKicked = 13002,
	UserBanned = 13003,
	RoomWasLeft = 13004,
	ReconnectionTimegateExpired = 13005,
	ShutdownInvoked = 13006,
	UserIsInBlocklist = 13007,
	ProgressionSnapshotSnapshotIdUnavailable = 14000,
	ParentEmailMissing = 15000,
	UserGraduated = 15001,
	AndroidJavaVMNotStored = 17000,
	PermissionRequiredPatchAvailable = 18000,
	PermissionRequiredSystemUpdate = 18001,
	PermissionAgeRestrictionFailure = 18002,
	PermissionAccountTypeFailure = 18003,
	PermissionChatRestriction = 18004,
	PermissionUGCRestriction = 18005,
	PermissionOnlinePlayRestricted = 18006,
	DesktopCrossplayApplicationNotBootstrapped = 19000,
	DesktopCrossplayServiceNotInstalled = 19001,
	DesktopCrossplayServiceStartFailed = 19002,
	DesktopCrossplayServiceNotRunning = 19003,
	UnexpectedError = 0x7FFFFFFF
}

enum ExternalAccountType {
	Epic = 0,
	Steam = 1,
	Psn = 2,
	Xbl = 3,
	Discord = 4,
	Gog = 5,
	Nintendo = 6,
	Uplay = 7,
	Openid = 8,
	Apple = 9,
	Google = 10,
	Oculus = 11,
	Itchio = 12,
	Amazon = 13
}

enum ExternalCredentialType {
	Epic = 0,
	SteamAppTicket = 1,
	PsnIdToken = 2,
	XblXstsToken = 3,
	DiscordAccessToken = 4,
	GogSessionTicket = 5,
	NintendoIdToken = 6,
	NintendoNsaIdToken = 7,
	UplayAccessToken = 8,
	OpenidAccessToken = 9,
	DeviceidAccessToken = 10,
	AppleIdToken = 11,
	GoogleIdToken = 12,
	OculusUseridNonce = 13,
	ItchioJwt = 14,
	ItchioKey = 15,
	EpicIdToken = 16,
	AmazonAccessToken = 17
}

enum LoginStatus {
	NotLoggedIn = 0,
	UsingLocalProfile = 1,
	LoggedIn = 2
}

enum RTCAudioInputStatus {
	Idle = 0,
	Recording = 1,
	RecordingSilent = 2,
	RecordingDisconnected = 3,
	Failed = 4
}

enum RTCAudioOutputStatus {
	Idle = 0,
	Playing = 1,
	Failed = 2
}

enum RTCAudioStatus {
	Unsupported = 0,
	Enabled = 1,
	Disabled = 2,
	AdminDisabled = 3,
	NotListeningDisabled = 4
}
