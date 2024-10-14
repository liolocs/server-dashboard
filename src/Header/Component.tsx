import { HeaderClient } from './Component.client'

import configPromise from '@payload-config'
import { getPayloadHMR } from '@payloadcms/next/utilities'

export async function Header() {
  const payload = await getPayloadHMR({ config: configPromise })
  const header = await payload.findGlobal({
    slug: 'header',
    depth: 1,
  })

  return <HeaderClient title={header?.title || ''} />
}
