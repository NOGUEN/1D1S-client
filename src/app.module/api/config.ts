const normalizeBaseUrl = (url: string): string => url.replace(/\/+$/, '');

const resolveApiBaseUrl = (): string => {
  const envBaseUrl =
    process.env.NEXT_PUBLIC_ODOS_API_URL || process.env.ODOS_API_URL;

  if (!envBaseUrl) {
    throw new Error(
      'Missing API URL env. Set NEXT_PUBLIC_ODOS_API_URL (client) or ODOS_API_URL (server).'
    );
  }

  return normalizeBaseUrl(envBaseUrl);
};

export const API_BASE_URL = resolveApiBaseUrl();
