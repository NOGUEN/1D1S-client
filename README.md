This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

## CodeGen

Run Graphql codegen with:

```bash
pnpm run codegen
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Local Alias (CORS)

If backend CORS requires a fixed local origin, run the app with a local alias
domain and HTTPS.

`pnpm dev` now bootstraps everything automatically:

1. add host entry to `/etc/hosts` (`local.1day1streak.com`)
2. create local HTTPS cert with `mkcert`
3. start server at `https://local.1day1streak.com`
4. open browser automatically

Prerequisite: `mkcert` must be installed on your machine.

```bash
pnpm dev
```

You can copy defaults from `.env.localalias.example`.

Manual shortcuts:

```bash
pnpm run init:local-dns -- local.1day1streak.com
pnpm run init-local-cert -- local.1day1streak.com
```

Configurable env vars:

- `LOCAL_ALIAS_HOST` (default: `local.1day1streak.com`)
- `LOCAL_ALIAS_PROTOCOL` (default: `https`)
- `LOCAL_ALIAS_PORT` (default: `443` for https, `3000` for http)
- `LOCAL_SSL_KEY_PATH` (default: `_wildcard.1day1streak.com-key.pem`)
- `LOCAL_SSL_CERT_PATH` (default: `_wildcard.1day1streak.com.pem`)
- `LOCAL_ALLOW_INSECURE_TLS=true` (optional, allow insecure backend TLS in dev)
- `LOCAL_BIND_HOST` (optional)
- `LOCAL_ALIAS_OPEN_BROWSER=false` (optional, disable auto-open)

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.

## 프로젝트 구조

```
1D1S-client
├─ public
│  ├─ fonts
│  └─ images
└─ src
   ├─ app                          # Next.js 라우트 (앱 디렉토리)
   │  ├─ layout.tsx                # 전역 레이아웃
   │  ├─ page.tsx                  # 홈 페이지
   │  ├─ page1
   │  │  └─ page.tsx
   │  └─ page2
   │     └─ page.tsx
   │
   ├─ features
   │  ├─ featureA
   │  │  ├─ domain                 # Usecase, repository 인터페이스
   │  │  │  ├─ entities
   │  │  │  ├─ repositories(interface)
   │  │  │  └─ usecases
   │  │  ├─ data                   # 데이터 접근 구현체
   │  │  │  ├─ clients             # 필요시 (선택)
   │  │  │  ├─ repositories(implement) # repository 구현체
   │  │  │  └─ services            # 외부 API들을 사용할 경우 (선택)
   │  │  └─ presentation           # UI 컴포넌트 & 훅
   │  │     ├─ components
   │  │     └─ hooks
   │  │
   │  └─ featureB
   │     ├─ domain
   │     ├─ data
   │     └─ presentation
   │
   └─ shared                       # 앱 전역에서 재사용되는 모듈
      ├─ components                # 디자인 시스템(ODOS-UI와 공통 UI)
      ├─ hooks                     # 공통 훅
      ├─ utils                     # 헬퍼 함수
      ├─ types                     # 전역 타입 정의
      ├─ interfaces                # DTO, Mapper, Middleware
      ├─ providers                 # Context / Provider 래핑
      └─ styles                    # 전역 스타일 / Tailwind 설정
```
