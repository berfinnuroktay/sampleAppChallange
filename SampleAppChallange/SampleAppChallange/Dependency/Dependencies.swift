extension InjectedValues {
    var apiService: ApiService {
        get { Self[ApiServiceProviderKey.self] }
        set { Self[ApiServiceProviderKey.self] = newValue }
    }
}

private struct ApiServiceProviderKey: InjectionKey {
    static var currentValue: ApiService = ApiService()
}
