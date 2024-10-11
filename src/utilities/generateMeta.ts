import type { Metadata } from 'next'

import type { Page } from '@/payload-types'

import { mergeOpenGraph } from './mergeOpenGraph'

export const generateMeta = async (args: { doc: Page }): Promise<Metadata> => {
  const { doc } = args || {}

  return {
    description: '',
    openGraph: mergeOpenGraph({
      description: '',
      images: [],
      title: 'Server Dashboard',
      url: Array.isArray(doc?.slug) ? doc?.slug.join('/') : '/',
    }),
    title: 'Server Dashboard',
  }
}
