#include "ieos.h"
using namespace godot;

bool IEOS::platform_interface_create(Ref<RefCounted> p_options) {
    CharString productId = VARIANT_TO_CHARSTRING(p_options->get("product_id"));
    CharString sandboxId = VARIANT_TO_CHARSTRING(p_options->get("sandbox_id"));
    CharString deploymentId = VARIANT_TO_CHARSTRING(p_options->get("deployment_id"));
    bool isServer = p_options->get("is_server");
    CharString encryptionKey = VARIANT_TO_CHARSTRING(p_options->get("encryption_key"));
    int flags = p_options->get("flags");
    int tickBudgetInMilliseconds = p_options->get("tick_budget_in_milliseconds");
    CharString clientId = VARIANT_TO_CHARSTRING(p_options->get("client_id"));
    CharString clientSecret = VARIANT_TO_CHARSTRING(p_options->get("client_secret"));
    CharString overrideCountryCode = VARIANT_TO_CHARSTRING(p_options->get("override_country_code"));
    CharString overrideLocaleCode = VARIANT_TO_CHARSTRING(p_options->get("override_locale_code"));

    std::cout << "productId " << productId.get_data() << std::endl;
    std::cout << "sandboxId " << sandboxId.get_data() << std::endl;
    std::cout << "deploymentId " << deploymentId.get_data() << std::endl;
    std::cout << "isServer " << isServer << std::endl;
    std::cout << "encryptionKey " << encryptionKey.get_data() << std::endl;
    std::cout << "flags " << flags << std::endl;
    std::cout << "tickBudgetInMilliseconds " << tickBudgetInMilliseconds << std::endl;
    std::cout << "clientId " << clientId.get_data() << std::endl;
    std::cout << "clientSecret " << clientSecret.get_data() << std::endl;
    std::cout << "overrideCountryCode " << overrideCountryCode.get_data() << std::endl;
    std::cout << "overrideLocaleCode " << overrideLocaleCode.get_data() << std::endl;
    std::cout << "done\n";

    EOS_Platform_Options platformOptions = {0};
    platformOptions.ApiVersion = EOS_PLATFORM_OPTIONS_API_LATEST;
    platformOptions.Reserved = nullptr;
    platformOptions.ProductId = productId.get_data();
    platformOptions.SandboxId = sandboxId.get_data();
    platformOptions.ClientCredentials.ClientId = nullptr;
    platformOptions.ClientCredentials.ClientSecret = nullptr;
    std::cout << "clientId length:" << clientId.length() << std::endl;
    if (clientId.length() != 0) {
        platformOptions.ClientCredentials.ClientId = clientId.get_data();
    }
    if (clientSecret.length() != 0) {
        platformOptions.ClientCredentials.ClientSecret = clientSecret.get_data();
    }
    platformOptions.bIsServer = EOS_FALSE;
    if (isServer) {
        platformOptions.bIsServer = EOS_TRUE;
    }
    platformOptions.EncryptionKey = nullptr;
    if (encryptionKey.length() != 0) {
        platformOptions.EncryptionKey = encryptionKey.get_data();
    }
    platformOptions.OverrideCountryCode = nullptr;
    platformOptions.OverrideLocaleCode = nullptr;
    if (overrideCountryCode.length() != 0) {
        platformOptions.OverrideLocaleCode = overrideCountryCode.get_data();
    }
    if (overrideLocaleCode.length() != 0) {
        platformOptions.OverrideCountryCode = overrideLocaleCode.get_data();
    }
    platformOptions.DeploymentId = deploymentId.get_data();
    platformOptions.Flags = flags;
    platformOptions.CacheDirectory = nullptr;
    platformOptions.TickBudgetInMilliseconds = tickBudgetInMilliseconds;

    EOS_Platform_RTCOptions rtcOptions = {0};
    rtcOptions.ApiVersion = EOS_PLATFORM_RTCOPTIONS_API_LATEST;
#ifdef _WIN32
    EOS_Windows_RTCOptions windowsRTCOptions = {0};
    windowsRTCOptions.ApiVersion = EOS_WINDOWS_RTCOPTIONS_API_LATEST;
    CharString xAudio29DllPath = ProjectSettings::get_singleton()->globalize_path("res://addons/epic-online-services-godot/bin/x64/xaudio2_9redist.dll").utf8();
    windowsRTCOptions.XAudio29DllPath = xAudio29DllPath.get_data();
    rtcOptions.PlatformSpecificOptions = &windowsRTCOptions;
#else
    rtcOptions.PlatformSpecificOptions = nullptr;
#endif
    platformOptions.RTCOptions = &rtcOptions;

    if (!platformOptions.IntegratedPlatformOptionsContainerHandle) {
        EOS_IntegratedPlatform_CreateIntegratedPlatformOptionsContainerOptions CreateIntegratedPlatformOptionsContainerOptions = {};
        CreateIntegratedPlatformOptionsContainerOptions.ApiVersion = EOS_INTEGRATEDPLATFORM_CREATEINTEGRATEDPLATFORMOPTIONSCONTAINER_API_LATEST;

        EOS_EResult createIntegratedPlatformOptionsContainerResult = EOS_IntegratedPlatform_CreateIntegratedPlatformOptionsContainer(&CreateIntegratedPlatformOptionsContainerOptions, &platformOptions.IntegratedPlatformOptionsContainerHandle);
        if (createIntegratedPlatformOptionsContainerResult != EOS_EResult::EOS_Success) {
            UtilityFunctions::print("[EOS SDK] Failed to create integrated platform options container:" + String(EOS_EResult_ToString(createIntegratedPlatformOptionsContainerResult)));
        }
    }

    s_platformInterface = EOS_Platform_Create(&platformOptions);

    if (platformOptions.IntegratedPlatformOptionsContainerHandle) {
        EOS_IntegratedPlatformOptionsContainer_Release(platformOptions.IntegratedPlatformOptionsContainerHandle);
    }

    if (s_platformInterface == nullptr) {
        return false;
    }

    return true;
}

Dictionary IEOS::platform_interface_get_active_country_code(const String &p_user_id) {
    CharString user_id = p_user_id.utf8();
    EOS_EpicAccountId LocalUserId = EOS_EpicAccountId_FromString(user_id.get_data());
    char *OutBuffer = (char *)memalloc(EOS_COUNTRYCODE_MAX_LENGTH);
    EOS_EResult result = EOS_Platform_GetActiveCountryCode(s_platformInterface, LocalUserId, OutBuffer, nullptr);

    Dictionary dict;
    dict["result"] = (int)result;
    if (result == EOS_EResult::EOS_Success) {
        dict["country_code"] = String(OutBuffer);
        // TODO: should this be freed?
        // memfree(OutBuffer);
    }

    return dict;
}

Dictionary IEOS::platform_interface_get_active_locale_code(const String &p_user_id) {
    CharString user_id = p_user_id.utf8();
    EOS_EpicAccountId LocalUserId = EOS_EpicAccountId_FromString(user_id.get_data());
    char *OutBuffer = (char *)memalloc(EOS_COUNTRYCODE_MAX_LENGTH);
    EOS_EResult result = EOS_Platform_GetActiveLocaleCode(s_platformInterface, LocalUserId, OutBuffer, nullptr);

    Dictionary dict;
    dict["result"] = (int)result;
    if (result == EOS_EResult::EOS_Success) {
        dict["locale_code"] = String(OutBuffer);
        // TODO: should this be freed?
        // memfree(OutBuffer);
    }

    return dict;
}

Dictionary IEOS::platform_interface_get_override_country_code() {
    char *OutBuffer = (char *)memalloc(EOS_COUNTRYCODE_MAX_LENGTH);
    int32_t *OutBufferLength = (int32_t *)memalloc(sizeof(int32_t));
    EOS_EResult result = EOS_Platform_GetOverrideCountryCode(s_platformInterface, OutBuffer, OutBufferLength);

    Dictionary dict;
    dict["result"] = (int)result;
    if (result == EOS_EResult::EOS_Success) {
        dict["country_code"] = String(OutBuffer);
        // TODO: should this be freed?
        // memfree(OutBuffer);
    }

    return dict;
}

Dictionary IEOS::platform_interface_get_override_locale_code() {
    char *OutBuffer = (char *)memalloc(EOS_COUNTRYCODE_MAX_LENGTH);
    int32_t *OutBufferLength = (int32_t *)memalloc(sizeof(int32_t));
    EOS_EResult result = EOS_Platform_GetOverrideLocaleCode(s_platformInterface, OutBuffer, OutBufferLength);

    Dictionary dict;
    dict["result"] = (int)result;
    if (result == EOS_EResult::EOS_Success) {
        dict["locale_code"] = String(OutBuffer);
        // TODO: should this be freed?
        // memfree(OutBuffer);
    }

    return dict;
}

int IEOS::platform_interface_set_override_country_code(const String &p_country_code) {
    CharString country_code = p_country_code.utf8();
    EOS_EResult result = EOS_Platform_SetOverrideCountryCode(s_platformInterface, country_code.get_data());

    return (int)result;
}

int IEOS::platform_interface_set_override_locale_code(const String &p_locale_code) {
    CharString locale_code = p_locale_code.utf8();
    EOS_EResult result = EOS_Platform_SetOverrideLocaleCode(s_platformInterface, locale_code.get_data());

    return (int)result;
}

int IEOS::platform_interface_check_for_launcher_and_restart() {
    EOS_EResult result = EOS_Platform_CheckForLauncherAndRestart(s_platformInterface);
    return (int)result;
}

int IEOS::platform_interface_initialize(Ref<RefCounted> p_options) {
    CharString productName = VARIANT_TO_CHARSTRING(p_options->get("product_name"));
    CharString productVersion = VARIANT_TO_CHARSTRING(p_options->get("product_version"));

    EOS_InitializeOptions initOptions = {0};
    initOptions.ApiVersion = EOS_INITIALIZE_API_LATEST;
    initOptions.ProductName = productName.get_data();
    initOptions.ProductVersion = productVersion.get_data();
    initOptions.AllocateMemoryFunction = nullptr;
    initOptions.ReallocateMemoryFunction = nullptr;
    initOptions.ReleaseMemoryFunction = nullptr;
    initOptions.Reserved = nullptr;
    initOptions.SystemInitializeOptions = nullptr;
    initOptions.OverrideThreadAffinity = nullptr;

    EOS_EResult res = EOS_Initialize(&initOptions);

    EOS_EResult setCallbackResult = EOS_Logging_SetCallback([](const EOS_LogMessage *logMessage) {
        Dictionary logMsg = Dictionary();
        logMsg["category"] = logMessage->Category;
        logMsg["message"] = logMessage->Message;
        logMsg["level"] = (int)logMessage->Level;
        IEOS::get_singleton()->emit_signal("logging_interface_callback", logMsg);
    });

    if (setCallbackResult != EOS_EResult::EOS_Success) {
        UtilityFunctions::print("[EOS SDK] Failed to set logging callback: " + String(EOS_EResult_ToString(setCallbackResult)));
    }

    return (int)res;
}

Dictionary IEOS::platform_interface_get_desktop_crossplay_status() {
    EOS_Platform_GetDesktopCrossplayStatusOptions options = {0};
    options.ApiVersion = EOS_PLATFORM_GETDESKTOPCROSSPLAYSTATUS_API_LATEST;
    EOS_Platform_GetDesktopCrossplayStatusInfo outDesktopCrossplayStatusInfo;
    EOS_EResult result = EOS_Platform_GetDesktopCrossplayStatus(s_platformInterface, &options, &outDesktopCrossplayStatusInfo);

    Dictionary dict;
    dict["result"] = (int)result;
    Dictionary desktopCrossplayStatus = Dictionary();
    if (result == EOS_EResult::EOS_Success) {
        desktopCrossplayStatus["status"] = (int)outDesktopCrossplayStatusInfo.Status;
        desktopCrossplayStatus["service_init_result"] = (int)outDesktopCrossplayStatusInfo.ServiceInitResult;
    }
    dict["desktop_crossplay_status"] = desktopCrossplayStatus;
    return dict;
}

int IEOS::platform_interface_set_application_status(int p_status) {
    EOS_EResult result = EOS_Platform_SetApplicationStatus(s_platformInterface, static_cast<EOS_EApplicationStatus>(p_status));
    return (int)result;
}

int IEOS::platform_interface_get_application_status() {
    EOS_EApplicationStatus status = EOS_Platform_GetApplicationStatus(s_platformInterface);
    return static_cast<int>(status);
}

int IEOS::platform_interface_set_network_status(int p_status) {
    EOS_EResult result = EOS_Platform_SetNetworkStatus(s_platformInterface, static_cast<EOS_ENetworkStatus>(p_status));
    return static_cast<int>(result);
}

int IEOS::platform_interface_get_network_status() {
    EOS_ENetworkStatus status = EOS_Platform_GetNetworkStatus(s_platformInterface);
    return static_cast<int>(status);
}

void IEOS::platform_interface_release() { return; }

int IEOS::platform_interface_shutdown() { return 1; }
