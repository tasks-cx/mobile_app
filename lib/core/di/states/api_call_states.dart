enum ApiResponse {
  loading('loading'),
  success('success'),
  error('error');

  final String name;

  const ApiResponse(this.name);

  static ApiResponse fromJson(String apiRes) {
    switch (apiRes) {
      case 'loading':
        return ApiResponse.loading;
      case 'success':
        return ApiResponse.success;
      case 'error':
        return ApiResponse.error;
      default:
        return ApiResponse.error;
    }
  }
}
