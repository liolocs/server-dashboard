import { Payload } from 'payload'

import { seed as seedScript } from '@/seed'

export const seedHandler = async ({ payload }: { payload: Payload }): Promise<Response> => {
  try {
    // Create a transaction so that all seeding happens in one transaction
    // @ts-ignore
    await seedScript({ payload })

    return Response.json({ success: true })
  } catch (error: unknown) {
    const message = error instanceof Error ? error.message : 'Unknown error'
    payload.logger.error(message)
    return Response.json({ error: message }, { status: 500 })
  }
}
